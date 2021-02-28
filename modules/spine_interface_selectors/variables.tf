terraform {
  experiments = [module_variable_optional_attrs]
}

variable "spine_interface_selectors" {
  description = "Create a Spine Interface Selector"
  type = map(object({
    annotation_block    = optional(string)
    annotation_selector = optional(string)
    descr_block         = optional(string)
    descr_selector      = optional(string)
    module_from         = optional(number)
    module_to           = optional(number)
    name_block          = optional(string)
    name_selector       = optional(string)
    name_alias_block    = optional(string)
    name_alias_selector = optional(string)
    policy_group        = optional(string)
    port_from           = optional(number)
    port_to             = optional(number)
    selector_type       = optional(string)
    spine_profile       = optional(string)
  }))
  default = {
    default = {
      annotation_block    = ""
      annotation_selector = ""
      descr_block         = ""
      descr_selector      = ""
      module_from         = 1
      module_to           = 1 # The default value is the same as module_from.
      name_block          = "=same as name_selector"
      name_selector       = "Eth1-01"
      name_alias_block    = ""
      name_alias_selector = ""
      policy_group        = ""
      port_from           = 1
      port_to             = 1       # The default value is the same as port_from.
      selector_type       = "range" # Options are (ALL|range)".
      spine_profile       = ""
    }
  }
}

locals {
  spine_interface_selectors = {
    for k, v in var.spine_interface_selectors : k => {
      annotation_block    = (v.annotation_block != null ? v.annotation_block : "")
      annotation_selector = (v.annotation_selector != null ? v.annotation_selector : "")
      descr_block         = (v.descr_block != null ? v.descr_block : "")
      descr_selector      = (v.descr_selector != null ? v.descr_selector : "")
      module_from         = coalesce(v.module_from, 1)
      module_to           = coalesce(v.module_to, v.module_from, 1)
      name_block          = coalesce(v.name_block, v.name_selector, "Eth1-01")
      name_selector       = coalesce(v.name_selector, "Eth1-01")
      name_alias_block    = (v.name_alias_block != null ? v.name_alias_block : "")
      name_alias_selector = (v.name_alias_selector != null ? v.name_alias_selector : "")
      policy_group        = (v.policy_group != null ? v.policy_group : "")
      port_from           = coalesce(v.port_from, 1)
      port_to             = coalesce(v.port_to, v.port_from, 1)
      selector_type       = coalesce(v.selector_type, "range")
      spine_profile       = (v.spine_profile != null ? v.spine_profile : "")
    }
  }
}
