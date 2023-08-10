output "acm_arn" {
  value = aws_acm_certificate.cert.arn
}

output "acm_domain_validation_options" {
  value = aws_acm_certificate.cert.domain_validation_options
}

output "acm_domain_name" {
  value = aws_acm_certificate.cert.domain_name
}

output "acm_subject_alternative_names" {
  value = aws_acm_certificate.cert.subject_alternative_names
}