terraform {
  experiments = [module_variable_optional_attrs]
}

variable "vlan_list" {
  description = "Add VLANs to VLAN Pools"
  type = map(object({
    alloc_mode  = optional(string)
    annotation  = optional(string)
    from        = optional(number)
    name_alias  = optional(string)
    role        = optional(string)
    to          = optional(number)
    vlan_pool   = optional(string)
  }))
  default = {
    default = {
      alloc_mode  = "static"
      annotation  = ""
      from        = 1
      name_alias  = ""
      role        = "external"
      to          = 1
      vlan_pool   = ""
    }
  }
}

locals {
  vlan_list = {
    for k, v in var.vlan_list : k => {
      alloc_mode  = coalesce(v.alloc_mode, "static")
      annotation  = (v.annotation != null ? v.annotation : "")
      from        = (v.from != null ? v.from : 1)
      name_alias  = (v.name_alias != null ? v.name_alias : "")
      role        = coalesce(v.role, "external")
      to          = coalesce(v.to, 1)
      vlan_pool   = (v.vlan_pool != null ? v.vlan_pool : "")
    }
  }
}

