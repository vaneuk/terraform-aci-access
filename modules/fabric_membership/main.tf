/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-{pod_id}/node-{node_id}"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "membership" {
  for_each    = local.membership
  annotation  = each.value["annotation"]
  ext_pool_id = each.value["ext_pool_id"]
  fabric_id   = each.value["fabric_id"]
  name        = each.value["name"]
  name_alias  = each.value["name_alias"]
  node_id     = each.value["node_id"]
  node_type   = each.value["node_type"]
  pod_id      = each.value["pod_id"]
  role        = each.value["role"]
  serial      = each.value["serial"]
}
