output "spine_interface_selectors" {
  description = "This output will provide the Spine Interface Selector ID."
  value       = { for p in sort(keys(aci_rest.spine_interface_selectors)) : p => aci_rest.spine_interface_selectors[p].id }
}
