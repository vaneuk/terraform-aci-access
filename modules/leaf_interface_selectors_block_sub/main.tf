#-------------------------------------------
# Create Leaf Interface Selector sub-Blocks
#-------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-{leaf_name}/hports-{interface_selector}-typ-range/portblk-{block_name}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {leaf_name}:{interface_selector}
*/
resource "aci_access_sub_port_block" "port_block_sub" {
  for_each                = local.port_block_sub
  access_port_selector_dn = each.value["interface_selector"]
  annotation              = each.value["annotation"]
  description             = each.value["description"]
  name                    = each.value["name"]
  name_alias              = each.value["name_alias"]
  from_card               = each.value["module_from"]
  from_port               = each.value["port_from"]
  from_sub_port           = each.value["sub_port_from"]
  to_card                 = each.value["module_to"]
  to_port                 = each.value["port_to"]
  to_sub_port             = each.value["sub_port_to"]
}
