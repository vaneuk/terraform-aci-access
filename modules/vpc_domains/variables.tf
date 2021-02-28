terraform {
  experiments = [module_variable_optional_attrs]
}

variable "vpc_domains" {
  description = "Create Explicit VPC Protection Group(s)"
  type = map(object({
    annotation_domain        = optional(string)
    annotation_domain_policy = optional(string)
    annotation_node1         = optional(string)
    annotation_node2         = optional(string)
    domain_policy            = optional(string)
    name                     = optional(string)
    name_alias_node1         = optional(string)
    name_alias_node2         = optional(string)
    node1_id                 = optional(number)
    node2_id                 = optional(number)
    pod_id                   = optional(number)
    vpc_domain_id            = optional(number)
  }))
  default = {
    default = {
      annotation_domain        = ""
      annotation_domain_policy = ""
      annotation_node1         = ""
      annotation_node2         = ""
      domain_policy            = "default"
      name                     = "leaf101-102-vpc"
      name_alias_node1         = ""
      name_alias_node2         = ""
      node1_id                 = 201
      node2_id                 = 202
      pod_id                   = 1
      vpc_domain_id            = 201
    }
  }
}

locals {
  vpc_domains = {
    for k, v in var.vpc_domains : k => {
      annotation_domain        = (v.annotation_domain != null ? v.annotation_domain : "")
      annotation_domain_policy = (v.annotation_domain_policy != null ? v.annotation_domain_policy : "")
      annotation_node1         = (v.annotation_node1 != null ? v.annotation_node1 : "")
      annotation_node2         = (v.annotation_node2 != null ? v.annotation_node2 : "")
      domain_policy            = coalesce(v.domain_policy, "default")
      name                     = coalesce(v.name, "leaf101-102-vpc")
      name_alias_node1         = (v.name_alias_node1 != null ? v.name_alias_node1 : "")
      name_alias_node2         = (v.name_alias_node2 != null ? v.name_alias_node2 : "")
      node1_id                 = coalesce(v.node1_id, 201)
      node2_id                 = coalesce(v.node2_id, 202)
      pod_id                   = coalesce(v.pod_id, 1)
      vpc_domain_id            = coalesce(v.vpc_domain_id, 201)
    }
  }
}
