output "layer3" {
  value = { for v in sort(keys(aci_l3_domain_profile.layer3)) : v => aci_l3_domain_profile.layer3[v].id }
}

output "physical" {
  value = { for v in sort(keys(aci_physical_domain.physical)) : v => aci_physical_domain.physical[v].id }
}
