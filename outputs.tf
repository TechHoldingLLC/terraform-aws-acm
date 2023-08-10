output "arn" {
  value = aws_acm_certificate.cert.arn
}

output "domain_validation_options" {
  value = aws_acm_certificate.cert.domain_validation_options
}

output "domain_name" {
  value = aws_acm_certificate.cert.domain_name
}

output "subject_alternative_names" {
  value = aws_acm_certificate.cert.subject_alternative_names
}