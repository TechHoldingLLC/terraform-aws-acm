###############
# acm/data.tf #
###############

locals {
  ## Retriving all list of all domains and hosted zone ids from domain_config variable
  domains = length(var.domain_config) > 0 ? flatten([for name in var.domain_config : name.domain_name]) : var.domains

  domain_name = local.domains[0]

  ## Retriving domain names from domains excluding domain_name, it will be an empty list if ACM needs to have single domain
  subject_alternative_names = [for name in local.domains : name if name != local.domain_name]
}
