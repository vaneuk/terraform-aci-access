output "vlan_pool" {
  value = { for v in sort(keys(aci_vlan_pool.vlan_pool)) : v => aci_vlan_pool.vlan_pool[v].id }
}
