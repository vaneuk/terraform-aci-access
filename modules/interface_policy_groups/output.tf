output "access" {
  description = "This output will provide the Leaf Access Port Policy Group ID."
  value       = { for p in sort(keys(aci_leaf_access_port_policy_group.access)) : p => aci_leaf_access_port_policy_group.access[p].id }
}

output "breakout" {
  description = "This output will provide the Breakout Policy Group ID."
  value       = { for p in sort(keys(aci_rest.breakout)) : p => aci_rest.breakout[p].id }
}

output "bundle" {
  description = "This output will provide the Leaf Bundle (port-channel|vpc) Port Policy Group ID."
  value       = { for p in sort(keys(aci_leaf_access_bundle_policy_group.bundle)) : p => aci_leaf_access_bundle_policy_group.bundle[p].id }
}
