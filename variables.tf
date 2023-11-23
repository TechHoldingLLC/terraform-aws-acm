variable "domain_name" {
  description = "Domain name to crate cert for"
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 zone id"
  type        = string
  default     = ""
}

variable "subject_alternative_names" {
  description = "Alternative domains to use"
  type        = list(any)
  default     = []
}

variable "key_algorithm" {
  description = "Algorithm used for encryption"
  type        = string
  default     = "RSA_2048"
}