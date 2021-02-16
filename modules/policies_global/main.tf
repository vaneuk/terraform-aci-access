#------------------------------------------
# Create Attachable Access Entity Profiles
#------------------------------------------

/*
API Information:
 - Class: "infraAttEntityP"
 - Distinguished Name: "uni/infra/attentp-{Policy Name}"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : {Policy Name}
*/
resource "aci_attachable_access_entity_profile" "aaep" {
  for_each                = local.aaep
  annotation              = each.value["annotation"]
  description             = each.value["description"]
  name                    = each.value["name"]
  name_alias              = each.value["name_alias"]
  relation_infra_rs_dom_p = [each.value["domain"]]
}

