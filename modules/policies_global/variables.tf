terraform {
  experiments = [module_variable_optional_attrs]
}

variable "aaep" {
  description = "Create a Attachable Access Entity Profile: Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : {Policy Name}"
  type = map(object({
    annotation  = optional(string)
    description = optional(string)
    domain      = optional(string)
    domain_id   = optional(string)
    name        = optional(string)
    name_alias  = optional(string)
    alloc_mode  = optional(string)
  }))
  default = {
    default = {
      annotation  = ""
      description = ""
      domain      = "l3out"
      domain_id   = "l3out.id"
      name        = "l3out"
      name_alias  = ""
    }
  }
}

locals {
  aaep = {
    for k, v in var.vlan_pool : k => {
      annotation  = (v.annotation == null ? v.annotation : "")
      description = (v.description == null ? v.description : "")
      domain      = coalesce(v.domain, "l3out.id")
      domain_id   = coalesce(v.domain, "l3out")
      name        = coalesce(v.name, "l3out")
      name_alias  = (v.name_alias == null ? v.name_alias : "")
    }
  }
}
