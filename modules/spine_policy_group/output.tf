output "spine_policy_group" {
  value = { for p in sort(keys(aci_rest.spine_policy_group)) : p => aci_rest.spine_policy_group[p].id }
}
