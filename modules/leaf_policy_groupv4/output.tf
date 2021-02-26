output "leaf_policy_grp" {
  value = { for p in sort(keys(aci_rest.leaf_policy_group)) : p => aci_rest.leaf_policy_group[p].id }
}
