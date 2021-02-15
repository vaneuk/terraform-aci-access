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
    vlan_pool_id  = optional(string)
  }))
  default = {
    default = {
      annotation    = ""
      name          = "l3out"
      name_alias    = ""
      vlan_pool     = "l3out"
      vlan_pool_id  = "l3out.id"
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
    vlan_pool_id  = optional(string)
  }))
  default = {
    default = {
      annotation    = ""
      name          = "access"
      name_alias    = ""
      vlan_pool     = "access"
      vlan_pool_id  = "access.id"
    }
  }
}

locals {
  layer3_domain = {
    for k, d in var.vlan_pool : k => {
      annotation    = (d.annotation == null ? v.annotation : "")
      name          = coalesce(d.name, "l3out")
      name_alias    = (d.name_alias == null ? v.name_alias : "")
      vlan_pool     = coalesce(d.vlan_pool_id, "l3out")
      vlan_pool_id  = coalesce(d.vlan_pool_id, "l3out.id")
    }
  }
  physical_domain = {
    for k, d in var.vlan_pool : k => {
      annotation    = (d.annotation == null ? v.annotation : "")
      name          = coalesce(d.name, "access")
      name_alias    = (d.name_alias == null ? v.name_alias : "")
      vlan_pool     = coalesce(d.vlan_pool_id, "access")
      vlan_pool_id  = coalesce(d.vlan_pool_id, "access.id")
    }
  }
}
