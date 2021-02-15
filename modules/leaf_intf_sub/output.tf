output "vlan_pool_id" {
    value = { for p in sort(keys(aci_vlan_pool.vlan_pool)) : p => aci_vlan_pool.vlan_pool[p].id }
}
