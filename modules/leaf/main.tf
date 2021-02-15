/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-{Pod_ID}/node-{Node_ID}"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "default" {
	serial    = "{Serial}"
	name      = "{Name}"
	node_id   = "{Node_ID}"
	node_type = "{Node_Type}"
	role      = "{Switch_Role}"
	pod_id    = "{Pod_ID}"
}

/*
API Information:
 - Class: "maintMaintGrp"
 - Distinguished Name: "uni/fabric/maintgrp-switch_{Maint_Grp}"
GUI Location:
 - Admin > Firmware > Nodes:{Maint_Grp}
*/
resource "aci_rest" "maint_grp_{Name}" {
	path		= "/api/node/mo/uni/fabric/maintgrp-switch_{Maint_Grp}.json"
	class_name	= "maintMaintGrp"
	payload		= <<EOF
{
    "maintMaintGrp": {
        "attributes": {
            "dn": "uni/fabric/maintgrp-switch_{Maint_Grp}"
        },
        "children": [
            {
                "fabricNodeBlk": {
                    "attributes": {
                        "dn": "uni/fabric/maintgrp-switch_{Maint_Grp}/nodeblk-blk{Node_ID}-{Node_ID}",
                        "name": "blk{Node_ID}-{Node_ID}",
                        "from_": "{Node_ID}",
                        "to_": "{Node_ID}",
                        "rn": "nodeblk-blk{Node_ID}-{Node_ID}"
                    }
                }
            }
        ]
    }
}
	EOF
}

/*
API Information:
 - Class: "infraAccPortP"
 - Distinguished Name: "uni/infra/accportprof-{Name}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {Name}
*/
resource "aci_leaf_interface_profile" "{Name}" {
	name   = "{Name}"
}

/*
API Information:
 - Class: "infraNodeBlk"
 - Distinguished Name: " uni/infra/nprof-{Name}/leaves-{Name}-typ-range/nodeblk-{Name}"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > {Name}
*/
resource "aci_leaf_profile" "{Name}" {
	name                           = "{Name}"
	relation_infra_rs_acc_port_p   = [aci_leaf_interface_profile.{Name}.id]
	leaf_selector {
		name                    = "{Name}"
		switch_association_type = "range"
		node_block {
			name  = "{Name}"
			from_ = "{Node_ID}"
			to_   = "{Node_ID}"
		}
	}
}

/*
API Information:
 - Class: "infraLeafS"
 - Distinguished Name: "uni/infra/nprof-{Name}/leaves-{Name}-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Profiles > {Name}: Leaf Selectors Policy Group: default
*/
resource "aci_rest" "leaf_policy_group_{Name}" {
	depends_on		= [aci_leaf_profile.{Name}]
	path		= "/api/node/mo/uni/infra/nprof-{Name}/leaves-{Name}-typ-range.json"
	class_name	= "infraLeafS"
	payload		= <<EOF
{
    "infraLeafS": {
        "attributes": {
            "dn": "uni/infra/nprof-{Name}/leaves-{Name}-typ-range"
        },
        "children": [
            {
                "infraRsAccNodePGrp": {
                    "attributes": {
                        "tDn": "uni/infra/funcprof/accnodepgrp-default"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}