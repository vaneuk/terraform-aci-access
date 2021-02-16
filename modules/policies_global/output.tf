output "aaep" {
  value = { for v in sort(keys(aci_attachable_access_entity_profile.aaep)) : v => aci_attachable_access_entity_profile.aaep[v].id }
}
