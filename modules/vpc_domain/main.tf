#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "fabricExplicitGEp"
 - Distinguished Name: "uni/fabric/protpol/expgep-{{Name}}"
GUI Location:
 - Fabric > Access Policies > Policies > Virtual Port Channel default
*/
resource "aci_rest" "vpc_domain_{{Name}}" {
	path		= "/api/node/mo/uni/fabric/protpol/expgep-{{Name}}.json"
	class_name	= "fabricExplicitGEp"
	payload		= <<EOF
{
    "fabricExplicitGEp": {
        "attributes": {
            "dn": "uni/fabric/protpol/expgep-{{Name}}",
            "name": "{{Name}}",
            "id": "{{VPC_ID}}",
            "rn": "expgep-{{Name}}"
        },
        "children": [
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-{{Name}}/nodepep-{{Node1_ID}}",
                        "id": "{{Node1_ID}}",
                        "rn": "nodepep-{{Node1_ID}}"
                    },
                    "children": []
                }
            },
            {
                "fabricNodePEp": {
                    "attributes": {
                        "dn": "uni/fabric/protpol/expgep-{{Name}}/nodepep-{{Node2_ID}}",
                        "id": "{{Node2_ID}}",
                        "rn": "nodepep-{{Node2_ID}}"
                    },
                    "children": []
                }
            },
            {
                "fabricRsVpcInstPol": {
                    "attributes": {
                        "tnVpcInstPolName": "default"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}