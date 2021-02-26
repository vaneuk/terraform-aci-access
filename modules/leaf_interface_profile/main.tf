/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-{name}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {name}
*/
resource "aci_leaf_interface_profile" "leaf_interface_profile" {
  for_each    = local.leaf_interface_profile
  annotation  = each.value["annotation"]
  description = each.value["description"]
  name        = each.value["name"]
  name_alias  = each.value["name_alias"]
}
