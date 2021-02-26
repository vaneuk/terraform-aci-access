terraform {
  experiments = [module_variable_optional_attrs]
}

variable "leaf_profile" {
  description = "Create Leaf Profile."
  type = map(object({
    annotation                   = optional(string)
    description                  = optional(string)
    name                         = optional(string)
    name_alias                   = optional(string)
    node_block_from              = optional(number)
    node_block_name              = optional(string)
    node_block_to                = optional(number)
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
      node_block_from              = 201       # node_id of the first switch in the group
      node_block_name              = "blk1"    # Name for the Node Block
      node_block_to                = 201       # node_id of the last switch in the group
      leaf_selector_name           = "leaf201" # Name for the Leaf Selector in the Leaf Profile
      relation_infra_rs_acc_port_p = ""        # Relationship to the Leaf Interface Profile
      switch_association_type      = "range"   # Options are (ALL|ALL_IN_POD|range). Typically use range, which is the default.
    }
  }
}

locals {

  leaf_profile = {
    for k, v in var.leaf_profile : k => {
      annotation                   = (v.annotation != null ? v.annotation : "")
      description                  = (v.description != null ? v.description : "")
      name                         = coalesce(v.name, "leaf101")
      name_alias                   = (v.name_alias != null ? v.name_alias : "")
      node_block_from              = coalesce(v.node_block_from, 201)
      node_block_name              = coalesce(v.node_block_name, "blk1")
      node_block_to                = coalesce(v.node_block_to, 201)
      leaf_selector_name           = coalesce(v.leaf_selector_name, "leaf101")
      relation_infra_rs_acc_port_p = (v.relation_infra_rs_acc_port_p != null ? v.relation_infra_rs_acc_port_p : "")
      switch_association_type      = coalesce(v.switch_association_type, "range")
    }
  }

}
