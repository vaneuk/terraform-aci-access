output "leaf_interface_sub" {
  description = "This output will provide the Leaf Sub Interface Profile ID"
  value       = { for p in sort(keys(leaf_interface_sub.leaf_interface_sub)) : p => leaf_interface_sub.leaf_interface_sub[p].id }
}
