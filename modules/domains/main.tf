#------------------------------------------
# Create L3 Domain Profiles
#------------------------------------------

/*
API Information:
 - Class: "l3extDomP"
 - Distinguished Name: "uni/l3dom-{Policy Name}"
GUI Location:
 - Fabric > Access Policies > Physical and External Domains > L3 Domains: {Policy Name}
*/
resource "aci_l3_domain_profile" "layer3" {
  for_each                  = local.layer3_domain
  depends_on                = [each.value["vlan_pool"]]
  annotation                = each.value["annotation"]
  name                      = each.value["name"]
  name_alias                = each.value["name_alias"]
  relation_infra_rs_vlan_ns = each.value["vlan_pool"].id
}

#------------------------------------------
# Create Physical Domain Profiles
#------------------------------------------

/*
API Information:
 - Class: "physDomP"
 - Distinguished Name: "uni/infra/phys-{Policy Name}"
GUI Location:
 - Fabric > Access Policies > Physical and External Domains > Physical Domains: {Policy Name}
*/
resource "aci_physical_domain" "physical" {
  for_each                  = local.physical_domain
  depends_on                = [each.value["vlan_pool"]]
  annotation                = each.value["annotation"]
  name                      = each.value["name"]
  name_alias                = each.value["name_alias"]
  relation_infra_rs_vlan_ns = each.value["vlan_pool_id"].id
}
