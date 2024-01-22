variable "key_algorithm" {
  description = "Algorithm used for encryption"
  type        = string
  default     = "RSA_2048"
}

variable "domain_config" {
  description = "Map of domain names and the hosted zone IDs for Route53 Hosted zones"
  type        = list(any)
  default     = []
}

variable "domains" {
  description = "List of domain for ACM certificate for non Route53 Hosted zones"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Validation method for ACM certificate"
  type        = string
  default     = "DNS"
}