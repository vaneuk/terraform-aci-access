terraform {
  experiments = [module_variable_optional_attrs]
}

variable "vlan_pool" {
    description = "Create a VLAN Pool"
    type = map(object({
        alloc_mode  = optional(string)
        annotation  = optional(string)
        description = optional(string)
        name        = optional(string)
        name_alias  = optional(string)
    }))
    default = {
        default = {
            alloc_mode  = "static"
            annotation  = ""
            description = ""
            name        = "msite"
            name_alias  = ""
        }
    }
}

locals {
    vlan_pool = {
        for k, v in var.vlan_pool : k => {
            alloc_mode  = coalesce(v.alloc_mode, "static")
            annotation  = (v.annotation == null ? v.annotation : "")
            description = (v.description == null ? v.description : "")
            name        = coalesce(v.name, "msite")
            name_alias  = (v.name_alias == null ? v.name_alias : "")
        }
    }
}
