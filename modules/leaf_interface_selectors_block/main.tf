#------------------------------------------
# Create Leaf Interface Selector Blocks
#------------------------------------------

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-{leaf_name}/hports-{interface_selector}-typ-range/portblk-{block_name}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {leaf_name}:{interface_selector}
*/
resource "aci_access_port_block" "port_block" {
  for_each                = local.port_block
  access_port_selector_dn = each.value["interface_selector"]
  annotation              = each.value["annotation"]
  description             = each.value["description"]
  name                    = each.value["name"]
  name_alias              = each.value["name_alias"]
  from_card               = each.value["module_from"]
  from_port               = each.value["port_from"]
  to_card                 = each.value["module_to"]
  to_port                 = each.value["port_to"]
}
