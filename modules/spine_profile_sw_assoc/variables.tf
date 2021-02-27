terraform {
  experiments = [module_variable_optional_attrs]
}

variable "spine_switch_association" {
  description = "Assign Spine Nodes and Spine Interface Profile to a Spine Profile."
  type = map(object({
    annotation              = optional(string)
    description             = optional(string)
    name                    = optional(string)
    name_alias              = optional(string)
    node_block_from         = optional(number)
    node_block_to           = optional(number)
    spine_policy_group      = optional(string)
    spine_profile_dn        = optional(string)
    switch_association_type = optional(string)
  }))
  default = {
    default = {
      annotation              = ""
      description             = ""
      name                    = "default" # Name for the Leaf Profile
      name_alias              = ""
      node_block_from         = 101
      node_block_to           = 101
      spine_policy_group      = ""
      spine_profile_dn        = ""
      switch_association_type = "range" # Options are (ALL|ALL_IN_POD|range). Typically use range, which is the default.
    }
  }
}

locals {

  spine_switch_association = {
    for k, v in var.spine_switch_association : k => {
      annotation              = (v.annotation != null ? v.annotation : "")
      description             = (v.description != null ? v.description : "")
      name                    = coalesce(v.name, "leaf101")
      name_alias              = (v.name_alias != null ? v.name_alias : "")
      node_block_from         = coalesce(v.node_block_from, 101)
      node_block_to           = coalesce(v.node_block_to, 101)
      spine_policy_group      = (v.spine_policy_group != null ? v.spine_policy_group : "")
      spine_profile_dn        = (v.spine_profile_dn != null ? v.spine_profile_dn : "")
      switch_association_type = coalesce(v.switch_association_type, "range")
    }
  }

}
