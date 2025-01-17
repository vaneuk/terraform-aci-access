output "layer3" {
  description = "This output will provide the Layer 3 Domain ID."
  value       = { for v in sort(keys(aci_l3_domain_profile.layer3)) : v => aci_l3_domain_profile.layer3[v].id }
}

output "physical" {
  description = "This output will provide the Physical Domain ID."
  value       = { for v in sort(keys(aci_physical_domain.physical)) : v => aci_physical_domain.physical[v].id }
}
