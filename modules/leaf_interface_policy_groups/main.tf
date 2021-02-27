#------------------------------------------
# Create Access Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-{Name}"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > Leaf Access Port > {Name}
*/
resource "aci_leaf_access_port_policy_group" "access" {
  for_each                               = local.access
  annotation                             = each.value["annotation"]
  description                            = each.value["description"]
  name                                   = each.value["name"]
  name_alias                             = each.value["name_alias"]
  relation_infra_rs_att_ent_p            = each.value["relation_aaep"]          # class: infraAttEntityP    DN: "uni/infra/attentp-{Name}"
  relation_infra_rs_cdp_if_pol           = each.value["relation_cdp"]           # class: cdpIfPol           DN: "uni/infra/cdpIfP-{Name}"
  relation_infra_rs_copp_if_pol          = each.value["relation_copp"]          # class: coppIfPol          DN: "uni/infra/coppifpol-{Name}"
  relation_infra_rs_dwdm_if_pol          = each.value["relation_dwdm"]          # class: dwdmIfPol          DN: "uni/infra/dwdmifpol-{Name}"
  relation_infra_rs_fc_if_pol            = each.value["relation_fc_interface"]  # class: fcIfPol            DN: "uni/infra/fcIfPol-{Name}"
  relation_infra_rs_h_if_pol             = each.value["relation_link_level"]    # class: fabricHIfPol       DN: "uni/infra/hintfpol-{Name}"
  relation_infra_rs_l2_if_pol            = each.value["relation_l2_intf"]       # class: l2IfPol            DN: "uni/infra/l2IfP-{Name}"
  relation_infra_rs_l2_inst_pol          = each.value["relation_mtu_policy"]    # class: l2InstPol          DN: "uni/fabric/l2pol-{Name}"
  relation_infra_rs_l2_port_auth_pol     = each.value["relation_l2_port_auth"]  # class: l2PortAuthPol      DN: "uni/infra/portauthpol-{Name}"
  relation_infra_rs_l2_port_security_pol = each.value["relation_l2_port_sec"]   # class: l2PortSecurityPol  DN: "uni/infra/portsecurityP-{Name}"
  relation_infra_rs_lldp_if_pol          = each.value["relation_lldp"]          # class: lldpIfPol          DN: "uni/infra/lldpIfP-{Name}"
  relation_infra_rs_macsec_if_pol        = each.value["relation_macsec_policy"] # class: macsecIfPol        DN: "uni/infra/macsecifp-{Name}"
  relation_infra_rs_mcp_if_pol           = each.value["relation_mcp"]           # class: mcpIfPol           DN: "uni/infra/mcpIfP-{Name}"
  relation_infra_rs_mon_if_infra_pol     = each.value["relation_monitoring"]    # class: monInfraPol        DN: "uni/infra/moninfra-{Name}"
  # relation_infra_rs_netflow_monitor_pol    = [each.value["relation_netflow"]]     # class: netflowMonitorPol  DN: "uni/infra/monitorpol-{Name}"
  # relation_infra_rs_poe_if_pol             = [each.value["relation_poe"]]         # class: poeIfPol           DN: "uni/infra/poeIfP-{Name}" **There is no default Policy**
  relation_infra_rs_qos_dpp_if_pol         = each.value["relation_qos_dpp"]       # class: qosDppPol          DN: "uni/infra/qosdpppol-{Name}"
  relation_infra_rs_qos_egress_dpp_if_pol  = each.value["relation_egress_dpp"]    # class: qosDppPol          DN: "uni/infra/qosdpppol-{Name}"
  relation_infra_rs_qos_ingress_dpp_if_pol = each.value["relation_ingress_dpp"]   # class: qosDppPol          DN: "uni/infra/qosdpppol-{Name}"
  relation_infra_rs_qos_pfc_if_pol         = each.value["relation_qos_pfc"]       # class: qosPfcIfPol        DN: "uni/infra/pfc-{Name}"
  relation_infra_rs_qos_sd_if_pol          = each.value["relation_slow_drain"]    # class: qosSdIfPol         DN: "uni/infra/qossdpol-{Name}"
  relation_infra_rs_span_v_dest_grp        = [each.value["relation_span_dest"]]   # class: spanVDestGrp       DN: "uni/infra/vdestgrp-{Name}"
  relation_infra_rs_span_v_src_grp         = [each.value["relation_span_source"]] # class: spanVSrcGrp        DN: "uni/infra/vsrcgrp-{Name}"
  relation_infra_rs_stormctrl_if_pol       = each.value["relation_storm_ctrl"]    # class: stormctrlIfPol     DN: "uni/infra/stormctrlifp-{Name}"
  relation_infra_rs_stp_if_pol             = each.value["relation_stp"]           # class: stpIfPol           DN: "uni/infra/ifPol-{Name}"
}

#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-{Name}"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:{Name}
*/
resource "aci_rest" "breakout" {
  for_each   = local.breakout
  path       = "/api/node/mo/uni/infra/funcprof/brkoutportgrp-${each.value["name"]}.json"
  class_name = "infraBrkoutPortGrp"
  payload    = <<EOF
{
  "infraBrkoutPortGrp": {
    "attributes": {
      "dn": "uni/infra/funcprof/brkoutportgrp-${each.value["name"]}",
      "annotation": "${each.value["annotation"]}",
      "brkoutMap": "${each.value["breakout_map"]}",
      "descr": "${each.value["description"]}",
      "name": "${each.value["name"]}",
      "nameAlias": "${each.value["name_alias"]}"
    },
    "children": []
  }
}
  EOF
}

#------------------------------------------------
# Create Bundle (port-channel|vpc) Policy Groups
#------------------------------------------------

/*
API Information:
 - Class: "infraAccBndlGrp"
 - Distinguished Name: "uni/infra/funcprof/accbundle-{Name}"
GUI Location:
 - Fabric > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface > {Name}
*/
resource "aci_leaf_access_bundle_policy_group" "bundle" {
  for_each                               = local.bundle
  annotation                             = each.value["annotation"]
  description                            = each.value["description"]
  lag_t                                  = each.value["lag_type"]
  name                                   = each.value["name"]
  name_alias                             = each.value["name_alias"]
  relation_infra_rs_att_ent_p            = each.value["relation_aaep"]          # class: infraAttEntityP    DN: "uni/infra/attentp-{Name}"
  relation_infra_rs_cdp_if_pol           = each.value["relation_cdp"]           # class: cdpIfPol           DN: "uni/infra/cdpIfP-{Name}"
  relation_infra_rs_copp_if_pol          = each.value["relation_copp"]          # class: coppIfPol          DN: "uni/infra/coppifpol-{Name}"
  relation_infra_rs_fc_if_pol            = each.value["relation_fc_interface"]  # class: fcIfPol            DN: "uni/infra/fcIfPol-{Name}"
  relation_infra_rs_h_if_pol             = each.value["relation_link_level"]    # class: fabricHIfPol       DN: "uni/infra/hintfpol-{Name}"
  relation_infra_rs_l2_if_pol            = each.value["relation_l2_intf"]       # class: l2IfPol            DN: "uni/infra/l2IfP-{Name}"
  relation_infra_rs_l2_inst_pol          = each.value["relation_mtu_policy"]    # class: l2InstPol          DN: "uni/fabric/l2pol-{Name}"
  relation_infra_rs_l2_port_security_pol = each.value["relation_l2_port_sec"]   # class: l2PortSecurityPol  DN: "uni/infra/portsecurityP-{Name}"
  relation_infra_rs_lacp_pol             = each.value["relation_lacp"]          # class: lacpLagPol         DN: "uni/infra/lacplagp-{Name}"
  relation_infra_rs_lldp_if_pol          = each.value["relation_lldp"]          # class: lldpIfPol          DN: "uni/infra/lldpIfP-{Name}"
  relation_infra_rs_macsec_if_pol        = each.value["relation_macsec_policy"] # class: macsecIfPol        DN: "uni/infra/macsecifp-{Name}"
  relation_infra_rs_mcp_if_pol           = each.value["relation_mcp"]           # class: mcpIfPol           DN: "uni/infra/mcpIfP-{Name}"
  relation_infra_rs_mon_if_infra_pol     = each.value["relation_monitoring"]    # class: monInfraPol        DN: "uni/infra/moninfra-{Name}"
  # relation_infra_rs_netflow_monitor_pol    = [each.value["relation_netflow"]]     # class: netflowMonitorPol  DN: "uni/infra/monitorpol-{Name}"
  relation_infra_rs_qos_dpp_if_pol         = each.value["relation_qos_dpp"]       # class: qosDppPol          DN: "uni/infra/qosdpppol-{Name}"
  relation_infra_rs_qos_egress_dpp_if_pol  = each.value["relation_egress_dpp"]    # class: qosDppPol          DN: "uni/infra/qosdpppol-{Name}"
  relation_infra_rs_qos_ingress_dpp_if_pol = each.value["relation_ingress_dpp"]   # class: qosDppPol          DN: "uni/infra/qosdpppol-{Name}"
  relation_infra_rs_qos_pfc_if_pol         = each.value["relation_qos_pfc"]       # class: qosPfcIfPol        DN: "uni/infra/pfc-{Name}"
  relation_infra_rs_qos_sd_if_pol          = each.value["relation_slow_drain"]    # class: qosSdIfPol         DN: "uni/infra/qossdpol-{Name}"
  relation_infra_rs_span_v_dest_grp        = [each.value["relation_span_dest"]]   # class: spanVDestGrp       DN: "uni/infra/vdestgrp-{Name}" does span make sense here?
  relation_infra_rs_span_v_src_grp         = [each.value["relation_span_source"]] # class: spanVSrcGrp        DN: "uni/infra/vsrcgrp-{Name}" does span make sense here?
  relation_infra_rs_stormctrl_if_pol       = each.value["relation_storm_ctrl"]    # class: stormctrlIfPol     DN: "uni/infra/stormctrlifp-{Name}"
  relation_infra_rs_stp_if_pol             = each.value["relation_stp"]           # class: stpIfPol           DN: "uni/infra/ifPol-{Name}"
}
