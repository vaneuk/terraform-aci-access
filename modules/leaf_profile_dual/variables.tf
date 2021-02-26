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
    node_block1_from             = optional(number)
    node_block1_name             = optional(string)
    node_block1_to               = optional(number)
    node_block2_from             = optional(number)
    node_block2_name             = optional(string)
    node_block2_to               = optional(number)
    leaf_selector_name_1         = optional(string)
    leaf_selector_name_2         = optional(string)
    relation_infra_rs_acc_port_p = optional(string)
    switch_association_type_1    = optional(string)
    switch_association_type_2    = optional(string)
  }))
  default = {
    default = {
      annotation                   = ""
      description                  = ""
      name                         = "default" # Name for the Leaf Profile
      name_alias                   = ""
      node_block1_from             = 201       # node_id of the first switch in the group
      node_block1_name             = "blk1"    # Name for the Node Block
      node_block1_to               = 201       # node_id of the last switch in the group
      node_block2_from             = 202       # node_id of the first switch in the group
      node_block2_name             = "blk2"    # Name for the Node Block
      node_block2_to               = 202       # node_id of the last switch in the group
      leaf_selector_name_1         = "leaf201" # Name for the Leaf Selector in the Leaf Profile
      leaf_selector_name_2         = "leaf202" # Name for the Leaf Selector in the Leaf Profile
      relation_infra_rs_acc_port_p = ""        # Relationship to the Leaf Interface Profile
      switch_association_type_1    = "range"   # Options are (ALL|ALL_IN_POD|range). Typically use range, which is the default.
      switch_association_type_2    = "range"   # Options are (ALL|ALL_IN_POD|range). Typically use range, which is the default.
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
      node_block1_from             = coalesce(v.node_block1_from, 201)
      node_block1_name             = coalesce(v.node_block1_name, "blk1")
      node_block1_to               = coalesce(v.node_block1_to, 201)
      node_block2_from             = coalesce(v.node_block2_from, 202)
      node_block2_name             = coalesce(v.node_block2_name, "blk2")
      node_block2_to               = coalesce(v.node_block2_to, 202)
      leaf_selector_name_1         = coalesce(v.leaf_selector_name_1, "leaf101")
      leaf_selector_name_2         = coalesce(v.leaf_selector_name_2, "leaf101")
      relation_infra_rs_acc_port_p = (v.relation_infra_rs_acc_port_p != null ? v.relation_infra_rs_acc_port_p : "")
      switch_association_type_1    = coalesce(v.switch_association_type_1, "range")
      switch_association_type_2    = coalesce(v.switch_association_type_2, "range")
    }
  }

}
