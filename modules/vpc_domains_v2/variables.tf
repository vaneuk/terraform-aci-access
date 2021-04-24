terraform {
  experiments = [module_variable_optional_attrs]
}

variable "vpc_domains" {
  description = "Create Explicit VPC Protection Group(s)"
  type = map(object({
    annotation_domain        = optional(string)
    domain_policy            = optional(string)
    name                     = optional(string)
    node1_id                 = optional(number)
    node2_id                 = optional(number)
    vpc_domain_id            = optional(number)
  }))
  default = {
    default = {
      annotation_domain        = ""
      domain_policy            = "default"
      name                     = "leaf101-102-vpc"
      node1_id                 = 201
      node2_id                 = 202
      vpc_domain_id            = 201
    }
  }
}

locals {
  vpc_domains = {
    for k, v in var.vpc_domains : k => {
      annotation_domain        = (v.annotation_domain != null ? v.annotation_domain : "")
      domain_policy            = coalesce(v.domain_policy, "default")
      name                     = coalesce(v.name, "leaf101-102-vpc")
      node1_id                 = coalesce(v.node1_id, 201)
      node2_id                 = coalesce(v.node2_id, 202)
      vpc_domain_id            = coalesce(v.vpc_domain_id, 201)
    }
  }
}
