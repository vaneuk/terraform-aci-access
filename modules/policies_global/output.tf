output "aaep" {
  description = "This output will provide the Attachable Access Entity Profile ID."
  value       = { for v in sort(keys(aci_attachable_access_entity_profile.aaep)) : v => aci_attachable_access_entity_profile.aaep[v].id }
}
