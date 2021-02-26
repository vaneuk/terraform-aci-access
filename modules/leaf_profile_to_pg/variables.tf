terraform {
  experiments = [module_variable_optional_attrs]
}

variable "leaf_profile_policy_group" {
  description = "Assign Leaf Policy Group to "
  type = map(object({
    annotation                   = optional(string)
    description                  = optional(string)
    name                         = optional(string)
    name_alias                   = optional(string)
    node_block_from              = optional(string)
    node_block_name              = optional(string)
    node_block_to                = optional(string)
    leaf_selector_name           = optional(string)
    relation_infra_rs_acc_port_p = optional(string)
    switch_association_type      = optional(string)
  }))
  default = {
    default = {
      annotation                   = ""
      description                  = ""
      name                         = "default" # Name for the Leaf Profile
      name_alias                   = ""
      node_block_from              = "201"     # node_id of the first switch in the group
      node_block_name              = "blk1"    # Name for the Node Block
      node_block_to                = "201"     # node_id of the last switch in the group
      leaf_selector_name           = "leaf201" # Name for the Leaf Selector in the Leaf Profile
      relation_leaf_policy_group   = ""        # Relationship to the Leaf Policy Group
      relation_infra_rs_acc_port_p = ""        # Relationship to the Leaf Interface Profile
      switch_association_type      = "range"   # Options are (ALL|ALL_IN_POD|range). Typically use range, which is the default.
    }
  }
}

locals {

  leaf_profile_policy_group = {
    for k, v in var.leaf_profile_policy_group : k => {
      annotation  = (v.annotation != null ? v.annotation : "")
      ext_pool_id = (v.ext_pool_id != null ? v.ext_pool_id : "")
      fabric_id   = coalesce(v.fabric_id, 1)
      maint_group = coalesce(v.maint_group, "Maint_GrpA")
      name        = coalesce(v.name, "leaf101")
      name_alias  = (v.name_alias != null ? v.name_alias : "")
      node_id     = coalesce(v.fabric_id, 101)
      node_type   = coalesce(v.node_type, "unspecified")
      pod_id      = coalesce(v.pod_id, 1)
      role        = coalesce(v.role, "leaf")
      serial      = coalesce(v.serial, "TEP-1-101")
    }
  }

}
