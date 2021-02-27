output "vlan_pool_id" {
  description = "This output will provide the Layer 3 Domain ID"
  value       = { for p in sort(keys(aci_vlan_pool.vlan_pool)) : p => aci_vlan_pool.vlan_pool[p].id }
}
