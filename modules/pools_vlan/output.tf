output "vlan_pool" {
  description = "This output will provide the VLAN Pool ID."
  value       = { for v in sort(keys(aci_vlan_pool.vlan_pool)) : v => aci_vlan_pool.vlan_pool[v].id }
}
