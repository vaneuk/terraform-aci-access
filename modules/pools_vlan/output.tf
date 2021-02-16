output "vlan_pool" {
  value = { for p in sort(keys(aci_vlan_pool.vlan_pool)) : p => aci_vlan_pool.vlan_pool[p].id }
}
