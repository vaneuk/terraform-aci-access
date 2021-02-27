/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-{Name}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}
*/
resource "aci_spine_profile" "spine_profile" {
  for_each   = local.spine_profile
  annotation = each.value["annotation"]
  # description                     = each.value["description"]
  name                            = each.value["name"]
  name_alias                      = each.value["name_alias"]
  relation_infra_rs_sp_acc_port_p = [each.value["spine_interface_profile"]]
}
