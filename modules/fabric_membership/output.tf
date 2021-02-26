output "leaf_profile" {
  value = { for v in sort(keys(aci_fabric_node_member.membership)) : v => aci_fabric_node_member.membership[v].id }
}
