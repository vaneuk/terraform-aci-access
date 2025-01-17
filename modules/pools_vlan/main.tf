#------------------------------------------
# Create VLAN Pools
#------------------------------------------

/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[{Name}]-{Allocation Mode}"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[{Name}]
*/
resource "aci_vlan_pool" "vlan_pool" {
  for_each    = local.vlan_pool
  alloc_mode  = each.value["alloc_mode"]
  annotation  = each.value["annotation"]
  description = each.value["description"]
  name        = each.value["name"]
  name_alias  = each.value["name_alias"]
}
