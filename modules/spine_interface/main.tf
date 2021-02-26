#------------------------------------------
# Create VLAN Pools 
#------------------------------------------

/*
API Information:
 - Class: "infraSHPortS"
 - Distinguished Name: "uni/infra/spaccportprof-{Spine Interface Profile}/shports-{Interface Selector}-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > [Spine Interface Profile]:[Spine Interface Selector]
*/
resource "aci_rest" "spine_intf_selector" {
  depends_on = [each.value["spine_profile"]]
  path       = "/api/node/mo/uni/infra/spaccportprof-${each.value["spine_profile"]}/shports-${each.value["name"]}-typ-range.json"
  class_name = "infraSHPortS"
  payload    = <<EOF
{
    "infraSHPortS": {
        "attributes": {
            "dn": "uni/infra/spaccportprof-${each.value["spine_profile"]}/shports-${each.value["name"]}-typ-range",
            "name": "${each.value["name"]}",
            "rn": "shports-${each.value["name"]}-typ-range"
        },
        "children": [
            {
                "infraPortBlk": {
                    "attributes": {
                        "dn": "uni/infra/spaccportprof-${each.value["spine_profile"]}/shports-${each.value["name"]}-typ-range/portblk-${each.value["name"]}",
                        "fromCard": "${each.value["module"]}",
                        "fromPort": "${each.value["port"]}",
                        "toCard": "${each.value["module"]}",
                        "toPort": "${each.value["port"]}",
                        "name": "${each.value["name"]}",
                    }
                }
            }
        ]
    }
}
	EOF
}