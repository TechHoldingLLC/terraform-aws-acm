###############
# acm/acm.tf #
###############

## ACM certificate
resource "aws_acm_certificate" "cert" {
  domain_name               = local.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = local.subject_alternative_names
  key_algorithm             = var.key_algorithm

  lifecycle {
    create_before_destroy = true
  }
}

## Creating Route53 records for all the domains in ACM certificate
resource "aws_route53_record" "dns" {
  for_each = length(var.domain_config) > 0 ? {
    for option in aws_acm_certificate.cert.domain_validation_options : option.domain_name => {
      name        = option.resource_record_name
      record      = option.resource_record_value
      type        = option.resource_record_type
      domain_name = option.domain_name
    }
  } : {}

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = [for record in var.domain_config : record.hosted_zone_id if contains(record.domain_name, each.value.domain_name)][0]

  depends_on = [
    aws_acm_certificate.cert
  ]
}

## DNS validation for ACM certificate
resource "aws_acm_certificate_validation" "validation" {
  count                   = length(var.domain_config) > 0 ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.dns : record.fqdn]
  depends_on = [
    aws_acm_certificate.cert,
    aws_route53_record.dns
  ]
}