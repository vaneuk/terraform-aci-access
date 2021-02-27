terraform {
  experiments = [module_variable_optional_attrs]
}

variable "leaf_profile_policy_group" {
  description = "Assign Leaf Policy Group to "
  type = map(object({
    leaf_policy_group       = optional(string)
    leaf_profile_name       = optional(string)
    leaf_selector_name      = optional(string)
    switch_association_type = optional(string)
  }))
  default = {
    default = {
      leaf_policy_group       = ""        # Distinguished Name for the Leaf Policy Group
      leaf_profile_name       = "leaf201" # Name for the Leaf Profile
      leaf_selector_name      = "leaf201" # Name for the Leaf Selector in the Leaf Profile
      switch_association_type = "range"   # Options are (ALL|ALL_IN_POD|range). Typically use range, which is the default.
    }
  }
}

locals {

  leaf_profile_policy_group = {
    for k, v in var.leaf_profile_policy_group : k => {
      leaf_policy_group       = (v.leaf_policy_group != null ? v.leaf_policy_group : "")
      leaf_profile_name       = coalesce(v.leaf_profile_name, "leaf201")
      leaf_selector_name      = coalesce(v.leaf_selector_name, "leaf201")
      switch_association_type = coalesce(v.switch_association_type, "range")
    }
  }

}
