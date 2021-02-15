#------------------------------------------
# Create Spine Policy Group
#------------------------------------------

/*
API Information:
 - Class: "infraSpineAccNodePGrp"
 - Distinguished Name: "uni/infra/funcprof/spaccnodepgrp-default"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Policy Groups: default
*/
resource "aci_rest" "Spine_Policy_Group" {
	path		= "/api/node/mo/uni/infra/funcprof/spaccnodepgrp-default.json"
	class_name	= "infraSpineAccNodePGrp"
	payload		= <<EOF
{
	"infraSpineAccNodePGrp": {
		"attributes": {
			"dn": "uni/infra/funcprof/spaccnodepgrp-default",
			"name": "default",
			"descr": "Default Policy Group for Spine Switches - Created by Terraform Startup Script.",
			"rn": "spaccnodepgrp-default"
		},
		"children": [
			{
				"infraRsSpineCoppProfile": {
					"attributes": {
						"tnCoppSpineProfileName": "default"
					},
					"children": []
				}
			},
			{
				"infraRsSpineBfdIpv4InstPol": {
					"attributes": {
						"tnBfdIpv4InstPolName": "default"
					},
					"children": []
				}
			},
			{
				"infraRsSpineBfdIpv6InstPol": {
					"attributes": {
						"tnBfdIpv6InstPolName": "default"
					},
					"children": []
				}
			},
			{
				"infraRsIaclSpineProfile": {
					"attributes": {
						"tnIaclSpineProfileName": "default"
					},
					"children": []
				}
			},
			{
				"infraRsSpinePGrpToCdpIfPol": {
					"attributes": {
						"tnCdpIfPolName": "cdp_Enabled"
					},
					"children": []
				}
			},
			{
				"infraRsSpinePGrpToLldpIfPol": {
					"attributes": {
						"tnLldpIfPolName": "lldp_Enabled"
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}