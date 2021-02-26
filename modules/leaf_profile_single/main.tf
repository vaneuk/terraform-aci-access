/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: " uni/infra/nprof-{Name}"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > {Name}
*/
resource "aci_leaf_profile" "leaf_profile" {
  for_each   = local.leaf_profile
  annotation = each.value["annotation"]
  # description                   = each.value["description"]
  name                         = each.value["name"]
  name_alias                   = each.value["name_alias"]
  relation_infra_rs_acc_port_p = [each.value["leaf_interface_profile"]]
  leaf_selector {
    name                    = each.value["leaf_selector_name"]
    switch_association_type = each.value["switch_association_type"]
    node_block {
      name  = each.value["node_block_name"]
      from_ = each.value["node_block_from"]
      to_   = each.value["node_block_to"]
    }
  }
}
