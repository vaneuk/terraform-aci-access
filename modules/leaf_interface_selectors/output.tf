output "interface_selectors" {
  description = "This output will provide the Leaf Interface Selector ID."
  value       = { for p in sort(keys(aci_access_port_selector.interface_selectors)) : p => aci_access_port_selector.interface_selectors[p].id }
}
