terraform {
  experiments = [module_variable_optional_attrs]
}

variable "layer3_domain" {
  description = "Create a Layer 3 Domain.  Fabric > Access Policies > Physical and External Domains > L3 Domains: {Policy Name}"
  type = map(object({
    annotation    = optional(string)
    name          = optional(string)
    name_alias    = optional(string)
    vlan_pool     = optional(string)
  }))
  default = {
    default = {
      annotation    = ""
      name          = "l3out"
      name_alias    = ""
      vlan_pool     = ""
    }
  }
}

variable "physical_domain" {
  description = "Create a Physical Domain.  Fabric > Access Policies > Physical and External Domains > Physical Domains: {Policy Name}"
  type = map(object({
    annotation    = optional(string)
    name          = optional(string)
    name_alias    = optional(string)
    vlan_pool     = optional(string)
  }))
  default = {
    default = {
      annotation    = ""
      name          = "access"
      name_alias    = ""
      vlan_pool     = "access"
    }
  }
}

locals {
  layer3_domain = {
    for k, v in var.layer3_domain : k => {
      annotation    = (v.annotation == null ? v.annotation : "")
      name          = coalesce(v.name, "l3out")
      name_alias    = (v.name_alias == null ? v.name_alias : "")
      vlan_pool     = coalesce(v.vlan_pool, "")
    }
  }
  physical_domain = {
    for k, v in var.physical_domain : k => {
      annotation    = (v.annotation == null ? v.annotation : "")
      name          = coalesce(v.name, "access")
      name_alias    = (v.name_alias == null ? v.name_alias : "")
      vlan_pool     = coalesce(v.vlan_pool, "")
    }
  }
}
