/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-{Pod ID}/node-{Node ID}"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "inventory" {
  name      = each.value["name"]
  node_id   = each.value["node_id"]
  node_type = each.value["node_type"]
  pod_id    = each.value["pod_id"]
  role      = each.value["role"]
  serial    = each.value["serial"]
}

/*
API Information:
 - Class: "maintMaintGrp"
 - Distinguished Name: "uni/fabric/maintgrp-switch_{Maint_Grp}"
GUI Location:
 - Admin > Firmware > Nodes:{Maint_Grp}
*/
resource "aci_rest" "maint_group" {
  path       = "/api/node/mo/uni/fabric/maintgrp-switch_{Maint_Grp}.json"
  class_name = "maintMaintGrp"
  payload    = <<EOF
{
    "maintMaintGrp": {
        "attributes": {
            "dn": "uni/fabric/maintgrp-switch_{Maint_Grp}"
        },
        "children": [
            {
                "fabricNodeBlk": {
                    "attributes": {
                        "dn": "uni/fabric/maintgrp-switch_{Maint_Grp}/nodeblk-blk{each.value["node_id"]}-{each.value["node_id"]}",
                        "name": "blk{each.value["node_id"]}-{each.value["node_id"]}",
                        "from_": "{each.value["node_id"]}",
                        "to_": "{each.value["node_id"]}",
                        "rn": "nodeblk-blk{each.value["node_id"]}-{each.value["node_id"]}"
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
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-{Name}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > {Name}
*/
resource "aci_spine_interface_profile" "default" {
  name = each.value["spine_intf_profile"]
}

/*
API Information:
 - Class: "infraSpineP"
 - Distinguished Name: "uni/infra/spprof-{Name}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}
*/
resource "aci_spine_profile" "default" {
  name = each.value["spine_profile"]
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-{Name}/spines-{Name}-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}: Spine Selectors [{Name}]
*/
resource "aci_spine_switch_association" "default" {
  spine_profile_dn              = aci_spine_profile.default.id
  name                          = "{Name}"
  spine_switch_association_type = "range"
}

/*
API Information:
 - Class: "infraRsSpAccPortP"
 - Distinguished Name: "uni/infra/spaccportprof-{Name}"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}: Spine Interface Selector Profiles: {Name}
*/
resource "aci_spine_port_selector" "default" {
  spine_profile_dn = aci_spine_profile.default.id
  tdn              = aci_spine_interface_profile.default.id
}

/*
API Information:
 - Class: "infraSpineS"
 - Distinguished Name: "uni/infra/spprof-{Name}/spines-{Name}-typ-range"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}: Spine Selectors Policy Group: default
*/
resource "aci_rest" "spine_policy_group" {
  depends_on = [aci_spine_profile.default]
  path       = "/api/node/mo/uni/infra/spprof-{Name}/spines-{Name}-typ-range.json"
  class_name = "infraSpineS"
  payload    = <<EOF
{
    "infraSpineS": {
        "attributes": {
            "dn": "uni/infra/spprof-{Name}/spines-{Name}-typ-range"
        },
        "children": [
            {
                "infraRsSpineAccNodePGrp": {
                    "attributes": {
                        "tDn": "uni/infra/funcprof/spaccnodepgrp-default"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}
