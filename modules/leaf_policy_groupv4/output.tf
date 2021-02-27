output "leaf_policy_group" {
  description = "This output will provide the Leaf Policy Group ID."
  value       = { for p in sort(keys(aci_rest.leaf_policy_group)) : p => aci_rest.leaf_policy_group[p].id }
}
