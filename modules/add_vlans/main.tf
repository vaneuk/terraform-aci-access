/*
Add VLANs to VLAN Pools

API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[{Name}]-{Allocation_Mode}/from-[vlan-{VLAN_ID}]-to-[vlan-{VLAN_ID}]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[{Name}] > Encap Blocks
*/
resource "aci_ranges" "add_vlan" {
  for_each      = local.vlan_list
  alloc_mode    = each.value["alloc_mode"]
  annotation    = each.value["annotation"]
  name_alias    = each.value["name_alias"]
  vlan_pool_dn  = each.value["vlan_pool"]
  role          = each.value["role"]
  from          = "vlan-${each.value["from"]}"
  to            = "vlan-${each.value["to"]}"
}
