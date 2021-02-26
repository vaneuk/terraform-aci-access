output "leaf_interface_profile" {
  value = { for v in sort(keys(aci_leaf_interface_profile.leaf_interface_profile)) : v => aci_leaf_interface_profile.leaf_interface_profile[v].id }
}

