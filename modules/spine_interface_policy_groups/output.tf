output "spine_port" {
  description = "This output will provide the Spine Port Policy Group ID."
  value       = { for p in sort(keys(aci_spine_port_policy_group.spine_port)) : p => aci_spine_port_policy_group.spine_port[p].id }
}
