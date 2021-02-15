#------------------------------------------
# Create VLAN Pools
#------------------------------------------

/*
GUI Location
 - Fabric > Inventory > Topology: Interface + [Leaf] > [Highlight Port] > Select [Uplink/Downlink]
 - Note: The Conversion can only be configured when a interface selector has not been applied to the port
*/
resource "aci_rest" "convert_uplink_{{Name}}_{{Port_Name}}" {
    path        = "ncapi/config.json"
    class_name    = "_configCb"
    payload        = <<EOF
{
    "context": "_configCb",
    "attributes": {},
    "children": [
        {
            "context": "leaf",
            "attributes": {
                "nodeRange": "{{Node_ID}}"
            },
            "children": [
                {
                    "context": "interface",
                    "attributes": {},
                    "children": [
                        {
                            "context": "ethernet",
                            "attributes": {
                                "ifRange": "{{Port}}"
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
