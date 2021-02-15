terraform {
  experiments = [module_variable_optional_attrs]
}

variable "vlan_ranges" {
  description = "Add VLANs to VLAN Pools"
  type = map(object({
    depends_on  = optional(string)
    annotation  = optional(string)
    name_alias  = optional(string)
    description = optional(string)
    name        = optional(string)
  }))
  default = {
    default = {
      alloc_mode  = "static"
      annotation  = ""
      description = ""
      name_alias  = ""
      name        = "msite"
    }
  }
}

locals {
  vlan_pool = {
    for k, v in var.vlan_pool : k => {
      alloc_mode  = coalesce(v.alloc_mode, "static")
      annotation  = (v.annotation == null ? v.annotation : "")
      description = (v.description == null ? v.description : "")
      name_alias  = (v.name_alias == null ? v.name_alias : "")
      name        = coalesce(v.name, "msite")
    }
  }
}
