#------------------------------------------
# Create VLAN Pools 
#------------------------------------------

/*
API Information:
 - Class: "infraRsAccBaseGrp"
 - Distinguished Name: "uni/infra/accportprof-{{Switch_Name}}/hports-{{Interface_Selector}}-typ-range/rsaccBaseGrp"
GUI Location:
 - Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > [Spine Interface Profile] > [Spine Interface Selector]:[Interface Policy Group]
*/
resource "aci_rest" "pg_" {
	path		= "/api/node/mo/uni/infra/accportprof-{{Switch_Name}}/hports-{{Interface_Selector}}-typ-range/rsaccBaseGrp.json"
	class_name	= "infraRsAccBaseGrp"
	payload		= <<EOF
{
    "infraRsAccBaseGrp": {
        "attributes": {
            "tDn": "uni/infra/funcprof/{{Policy_Group}}"
        },
        "children": []
    }
}
	EOF
}