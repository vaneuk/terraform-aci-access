#------------------------------------------
# Create Leaf Interface Selectors
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: "uni/infra/accportprof-{leaf_name}/hports-{interface_selector}-typ-{selector_type}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {leaf_name}:{interface_selector}
*/
resource "aci_access_port_selector" "leaf_interface_selectors" {
  for_each = local.leaf_interface_selectors
  # depends_on                      = [aci_leaf_interface_profile.default]
  leaf_interface_profile_dn      = each.value["leaf_profile"]
  annotation                     = each.value["annotation"]
  description                    = each.value["description"]
  name                           = each.value["name"]
  name_alias                     = each.value["name_alias"]
  access_port_selector_type      = each.value["selector_type"] # Options are (ALL|range)
  relation_infra_rs_acc_base_grp = each.value["policy_group"]  # Class: infraAccBaseGrp
}
