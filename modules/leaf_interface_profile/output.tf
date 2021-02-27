output "leaf_interface_profile" {
  description = "This output will provide the Leaf Interface Profile ID."
  value       = { for v in sort(keys(aci_leaf_interface_profile.leaf_interface_profile)) : v => aci_leaf_interface_profile.leaf_interface_profile[v].id }
}
