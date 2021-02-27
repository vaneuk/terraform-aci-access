output "membership" {
  description = "This output will provide the Inventory Membership ID."
  value       = { for v in sort(keys(aci_fabric_node_member.membership)) : v => aci_fabric_node_member.membership[v].id }
}
