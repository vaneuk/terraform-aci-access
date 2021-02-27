output "spine_policy_group" {
  description = "The output will provide the Spine Policy Group ID"
  value       = { for p in sort(keys(aci_rest.spine_policy_group)) : p => aci_rest.spine_policy_group[p].id }
}
