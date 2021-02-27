output "spine_interface_profile" {
  description = "This output will provide the Spine Interface Profile ID."
  value       = { for v in sort(keys(aci_spine_interface_profile.spine_interface_profile)) : v => aci_spine_interface_profile.spine_interface_profile[v].id }
}
