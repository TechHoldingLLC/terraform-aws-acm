resource "aws_acm_certificate" "cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = var.subject_alternative_names
  key_algorithm             = var.key_algorithm
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
  }
}

resource "aws_route53_record" "dns" {
  count   = length(var.route53_zone_id) > 0 ? length(concat([var.domain_name], var.subject_alternative_names)) : 0
  name    = aws_acm_certificate.cert.domain_validation_options.*.resource_record_name[count.index]
  type    = aws_acm_certificate.cert.domain_validation_options.*.resource_record_type[count.index]
  zone_id = var.route53_zone_id
  records = [
    aws_acm_certificate.cert.domain_validation_options.*.resource_record_value[count.index]
  ]
  ttl = 300
}

resource "aws_acm_certificate_validation" "validation" {
  count                   = length(var.route53_zone_id) > 0 ? 1 : 0
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = aws_route53_record.dns.*.fqdn
}