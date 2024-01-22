variable "key_algorithm" {
  description = "Algorithm used for encryption"
  type        = string
  default     = "RSA_2048"
}

variable "domain_config" {
  description = "Map of domain names and the hosted zone IDs"
  type        = list(any)
  default     = []
}

variable "domains" {
  description = "List of domain for ACM certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Validation method for ACM certificate"
  type        = string
  default     = "DNS"
}