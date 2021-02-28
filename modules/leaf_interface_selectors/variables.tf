terraform {
  experiments = [module_variable_optional_attrs]
}

variable "leaf_interface_selectors" {
  description = "Create a Leaf Interface Selector"
  type = map(object({
    annotation    = optional(string)
    description   = optional(string)
    leaf_profile  = optional(string)
    name          = optional(string)
    name_alias    = optional(string)
    policy_group  = optional(string)
    selector_type = optional(string)
  }))
  default = {
    default = {
      annotation    = ""
      description   = ""
      leaf_profile  = ""
      name          = "Eth1-01"
      name_alias    = ""
      policy_group  = ""
      selector_type = "range" # Options are (ALL|range)"
    }
  }
}

locals {
  leaf_interface_selectors = {
    for k, v in var.leaf_interface_selectors : k => {
      annotation    = (v.annotation != null ? v.annotation : "")
      description   = (v.description != null ? v.description : "")
      leaf_profile  = (v.leaf_profile != null ? v.leaf_profile : "")
      name          = coalesce(v.name, "Eth1-01")
      name_alias    = (v.name_alias != null ? v.name_alias : "")
      policy_group  = (v.policy_group != null ? v.policy_group : "")
      selector_type = coalesce(v.selector_type, "range")
    }
  }
}
