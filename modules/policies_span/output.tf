output "cdp" {
  value = { for v in sort(keys(aci_cdp_interface_policy.cdp)) : v => aci_cdp_interface_policy.cdp[v].id }
}

output "fc_interface" {
  value = { for v in sort(keys(aci_interface_fc_policy.fc_interface)) : v => aci_interface_fc_policy.fc_interface[v].id }
}

output "l2_interface" {
  value = { for v in sort(keys(aci_l2_interface_policy.l2_interface)) : v => aci_l2_interface_policy.l2_interface[v].id }
}

output "lacp" {
  value = { for v in sort(keys(aci_lacp_policy.lacp)) : v => aci_lacp_policy.lacp[v].id }
}

output "link_level" {
  value = { for v in sort(keys(aci_fabric_if_pol.link_level)) : v => aci_fabric_if_pol.link_level[v].id }
}

output "lldp" {
  value = { for v in sort(keys(aci_lldp_interface_policy.lldp)) : v => aci_lldp_interface_policy.lldp[v].id }
}

output "mcp" {
  value = { for v in sort(keys(aci_miscabling_protocol_interface_policy.mcp)) : v => aci_miscabling_protocol_interface_policy.mcp[v].id }
}

output "stp" {
  value = { for v in sort(keys(aci_rest.stp)) : v => aci_rest.stp[v].id }
}
