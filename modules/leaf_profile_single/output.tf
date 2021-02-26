output "leaf_profile" {
  value = { for v in sort(keys(aci_leaf_profile.leaf_profile)) : v => aci_leaf_profile.leaf_profile[v].id }
}
