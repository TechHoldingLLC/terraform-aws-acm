output "acm_arn" {
  value = aws_acm_certificate.cert.arn
}

output "acm_domain_validation_options" {
  value = aws_acm_certificate.cert.domain_validation_options
}

output "domain_name" {
  value = aws_acm_certificate.cert.domain_name
}

output "subject_alternative_names" {
  value = aws_acm_certificate.cert.subject_alternative_names
}

output "validation_record_fqdns" {
  value = length(var.domain_config) > 0 ? aws_acm_certificate_validation.validation[0].validation_record_fqdns : null
}