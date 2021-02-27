output "spine_profile" {
  description = "Spine Profile ID."
  value       = { for v in sort(keys(aci_spine_profile.spine_profile)) : v => aci_spine_profile.spine_profile[v].id }
}
