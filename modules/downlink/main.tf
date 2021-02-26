#------------------------------------------
# Create VLAN Pools
#------------------------------------------

/*
GUI Location
 - Fabric > Inventory > Topology: Interface + [Leaf] > [Highlight Port] > Select [Uplink/Downlink]
 - Note: The Conversion can only be configured when a interface selector has not been applied to the port
*/
resource "aci_rest" "convert_uplink" {
  for_each   = local.convert_uplink
  path       = "ncapi/config.json"
  class_name = "_configCb"
  payload    = <<EOF
{
  "context": "_configCb",
  "attributes": {},
  "children": [
    {
      "context": "leaf",
      "attributes": {
        "nodeRange": "${each.value["node_id"]}"
      },
      "children": [
        {
          "context": "interface",
          "attributes": {},
          "children": [
            {
              "context": "ethernet",
              "attributes": {
                "ifRange": "${each.value["port"]}"
              },
              "children": [
                {
                  "context": "portdirect",
                  "negate": true,
                  "attributes": {}
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
  EOF
}
