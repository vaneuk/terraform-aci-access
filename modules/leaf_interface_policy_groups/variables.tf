terraform {
  experiments = [module_variable_optional_attrs]
}

variable "access" {
  description = "Create Access Policy Groups."
  type = map(object({
    annotation             = optional(string)
    description            = optional(string)
    name                   = optional(string)
    name_alias             = optional(string)
    relation_aaep          = optional(string)
    relation_cdp           = optional(string)
    relation_copp          = optional(string)
    relation_dwdm          = optional(string)
    relation_egress_dpp    = optional(string)
    relation_fc_interface  = optional(string)
    relation_ingress_dpp   = optional(string)
    relation_l2_intf       = optional(string)
    relation_l2_port_auth  = optional(string)
    relation_l2_port_sec   = optional(string)
    relation_link_level    = optional(string)
    relation_lldp          = optional(string)
    relation_macsec_policy = optional(string)
    relation_mcp           = optional(string)
    relation_monitoring    = optional(string)
    relation_mtu_policy    = optional(string)
    relation_netflow       = optional(string)
    relation_poe           = optional(string)
    relation_qos_dpp       = optional(string)
    relation_qos_pfc       = optional(string)
    relation_slow_drain    = optional(string)
    relation_span_dest     = optional(list(string))
    relation_span_source   = optional(list(string))
    relation_storm_ctrl    = optional(string)
    relation_stp           = optional(string)
  }))
  default = {
    default = {
      annotation             = ""
      description            = ""
      name                   = "default"
      name_alias             = ""
      relation_aaep          = "uni/infra/attentp-default"
      relation_cdp           = "uni/infra/cdpIfP-default"
      relation_copp          = "uni/infra/coppifpol-default"
      relation_dwdm          = "uni/infra/dwdmifpol-default"
      relation_egress_dpp    = "uni/infra/qosdpppol-default"
      relation_fc_interface  = "uni/infra/fcIfPol-default"
      relation_ingress_dpp   = "uni/infra/qosdpppol-default"
      relation_l2_intf       = "uni/infra/l2IfP-default"
      relation_l2_port_auth  = "uni/infra/portauthpol-default"
      relation_l2_port_sec   = "uni/infra/portsecurityP-default"
      relation_link_level    = "uni/infra/hintfpol-default"
      relation_lldp          = "uni/infra/lldpIfP-default"
      relation_macsec_policy = "uni/infra/macsecifp-default"
      relation_mcp           = "uni/infra/mcpIfP-default"
      relation_monitoring    = "uni/infra/moninfra-default"
      relation_mtu_policy    = "uni/fabric/l2pol-default"
      relation_netflow       = ""
      relation_poe           = ""
      relation_qos_dpp       = "uni/infra/qosdpppol-default"
      relation_qos_pfc       = "uni/infra/pfc-default"
      relation_slow_drain    = "uni/infra/qossdpol-default"
      relation_span_dest     = []
      relation_span_source   = []
      relation_storm_ctrl    = "uni/infra/stormctrlifp-default"
      relation_stp           = "uni/infra/ifPol-default"
    }
  }
}

variable "breakout" {
  description = "Create Breakout Policy Groups."
  type = map(object({
    annotation   = optional(string)
    breakout_map = optional(string)
    description  = optional(string)
    name         = optional(string)
    name_alias   = optional(string)
  }))
  default = {
    default = {
      annotation   = ""
      breakout_map = "10g-4x" # Options are (10g-4x|25g-4x|50g-8x|100g-2x|100g-4x)
      description  = "default 4x10G Breakout Policy"
      name         = "10g-4x"
      name_alias   = ""
    }
  }
}

variable "bundle" {
  description = "Create Bundle Policy Groups."
  type = map(object({
    annotation             = optional(string)
    description            = optional(string)
    lag_type               = optional(string)
    name                   = optional(string)
    name_alias             = optional(string)
    relation_aaep          = optional(string)
    relation_cdp           = optional(string)
    relation_copp          = optional(string)
    relation_dwdm          = optional(string)
    relation_egress_dpp    = optional(string)
    relation_fc_interface  = optional(string)
    relation_ingress_dpp   = optional(string)
    relation_l2_intf       = optional(string)
    relation_l2_port_sec   = optional(string)
    relation_lacp          = optional(string)
    relation_link_level    = optional(string)
    relation_lldp          = optional(string)
    relation_macsec_policy = optional(string)
    relation_mcp           = optional(string)
    relation_monitoring    = optional(string)
    relation_mtu_policy    = optional(string)
    relation_netflow       = optional(string)
    relation_qos_dpp       = optional(string)
    relation_qos_pfc       = optional(string)
    relation_slow_drain    = optional(string)
    relation_span_dest     = optional(list(string))
    relation_span_source   = optional(list(string))
    relation_storm_ctrl    = optional(string)
    relation_stp           = optional(string)
  }))
  default = {
    default = {
      annotation             = ""
      description            = ""
      lag_type               = "node" # Options are (link|node); link for port-channel and node for vpc.
      name                   = "default"
      name_alias             = ""
      relation_aaep          = "uni/infra/attentp-default"
      relation_cdp           = "uni/infra/cdpIfP-default"
      relation_copp          = "uni/infra/coppifpol-default"
      relation_dwdm          = "uni/infra/dwdmifpol-default"
      relation_egress_dpp    = "uni/infra/qosdpppol-default"
      relation_fc_interface  = "uni/infra/fcIfPol-default"
      relation_ingress_dpp   = "uni/infra/qosdpppol-default"
      relation_l2_intf       = "uni/infra/l2IfP-default"
      relation_l2_port_sec   = "uni/infra/portsecurityP-default"
      relation_lacp          = "uni/infra/lacplagp-default"
      relation_link_level    = "uni/infra/hintfpol-default"
      relation_lldp          = "uni/infra/lldpIfP-default"
      relation_macsec_policy = "uni/infra/macsecifp-default"
      relation_mcp           = "uni/infra/mcpIfP-default"
      relation_monitoring    = "uni/infra/moninfra-default"
      relation_mtu_policy    = "uni/fabric/l2pol-default"
      relation_netflow       = ""
      relation_qos_dpp       = "uni/infra/qosdpppol-default"
      relation_qos_pfc       = "uni/infra/pfc-default"
      relation_slow_drain    = "uni/infra/qossdpol-default"
      relation_span_dest     = []
      relation_span_source   = []
      relation_storm_ctrl    = "uni/infra/stormctrlifp-default"
      relation_stp           = "uni/infra/ifPol-default"
    }
  }
}


locals {

  access = {
    for k, v in var.access : k => {
      annotation             = (v.annotation != null ? v.annotation : "")
      description            = (v.description != null ? v.description : "")
      name                   = coalesce(v.name, "default")
      name_alias             = (v.name_alias != null ? v.name_alias : "")
      relation_aaep          = coalesce(v.relation_aaep, "uni/infra/attentp-default")
      relation_cdp           = coalesce(v.relation_cdp, "uni/infra/cdpIfP-cdp_enabled")
      relation_copp          = coalesce(v.relation_copp, "uni/infra/coppifpol-default")
      relation_dwdm          = coalesce(v.relation_dwdm, "uni/infra/dwdmifpol-default")
      relation_egress_dpp    = coalesce(v.relation_egress_dpp, "uni/infra/qosdpppol-default")
      relation_fc_interface  = coalesce(v.relation_fc_interface, "uni/infra/fcIfPol-default")
      relation_ingress_dpp   = coalesce(v.relation_ingress_dpp, "uni/infra/qosdpppol-default")
      relation_l2_intf       = coalesce(v.relation_l2_intf, "uni/infra/l2IfP-default")
      relation_l2_port_auth  = coalesce(v.relation_l2_port_auth, "uni/infra/portauthpol-default")
      relation_l2_port_sec   = coalesce(v.relation_l2_port_sec, "uni/infra/portsecurityP-default")
      relation_link_level    = coalesce(v.relation_link_level, "uni/infra/hintfpol-default")
      relation_lldp          = coalesce(v.relation_lldp, "uni/infra/lldpIfP-default")
      relation_macsec_policy = coalesce(v.relation_link_level, "uni/infra/macsecifp-default")
      relation_mcp           = coalesce(v.relation_mcp, "uni/infra/mcpIfP-default")
      relation_monitoring    = coalesce(v.relation_monitoring, "uni/infra/moninfra-default")
      relation_mtu_policy    = coalesce(v.relation_mtu_policy, "uni/fabric/l2pol-default")
      relation_netflow       = (v.relation_netflow != null ? v.relation_netflow : "")
      relation_poe           = (v.relation_poe != null ? v.relation_poe : "")
      relation_qos_dpp       = coalesce(v.relation_qos_dpp, "uni/infra/qosdpppol-default")
      relation_qos_pfc       = coalesce(v.relation_qos_pfc, "uni/infra/pfc-default")
      relation_slow_drain    = coalesce(v.relation_slow_drain, "uni/infra/qossdpol-default")
      relation_span_dest     = coalesce(v.relation_span_dest, [])
      relation_span_source   = coalesce(v.relation_span_source, [])
      relation_storm_ctrl    = coalesce(v.relation_storm_ctrl, "uni/infra/stormctrlifp-default")
      relation_stp           = coalesce(v.relation_stp, "uni/infra/ifPol-default")
    }
  }

  breakout = {
    for k, v in var.breakout : k => {
      annotation   = (v.annotation != null ? v.annotation : "")
      breakout_map = coalesce(v.breakout_map, "10g-4x")
      description  = (v.description != null ? v.description : "")
      name         = coalesce(v.name, "10g-4x")
      name_alias   = (v.name_alias != null ? v.name_alias : "")
    }
  }

  bundle = {
    for k, v in var.bundle : k => {
      annotation             = (v.annotation != null ? v.annotation : "")
      description            = (v.description != null ? v.description : "")
      lag_type               = coalesce(v.lag_type, "node")
      name                   = coalesce(v.name, "default")
      name_alias             = (v.name_alias != null ? v.name_alias : "")
      relation_aaep          = coalesce(v.relation_aaep, "uni/infra/attentp-default")
      relation_cdp           = coalesce(v.relation_cdp, "uni/infra/cdpIfP-cdp_enabled")
      relation_copp          = coalesce(v.relation_copp, "uni/infra/coppifpol-default")
      relation_dwdm          = coalesce(v.relation_dwdm, "uni/infra/dwdmifpol-default")
      relation_egress_dpp    = coalesce(v.relation_egress_dpp, "uni/infra/qosdpppol-default")
      relation_fc_interface  = coalesce(v.relation_fc_interface, "uni/infra/fcIfPol-default")
      relation_ingress_dpp   = coalesce(v.relation_ingress_dpp, "uni/infra/qosdpppol-default")
      relation_l2_intf       = coalesce(v.relation_l2_intf, "uni/infra/l2IfP-default")
      relation_l2_port_sec   = coalesce(v.relation_l2_port_sec, "uni/infra/portsecurityP-default")
      relation_lacp          = coalesce(v.relation_lacp, "uni/infra/lacplagp-default")
      relation_link_level    = coalesce(v.relation_link_level, "uni/infra/hintfpol-default")
      relation_lldp          = coalesce(v.relation_lldp, "uni/infra/lldpIfP-default")
      relation_macsec_policy = coalesce(v.relation_link_level, "uni/infra/macsecifp-default")
      relation_mcp           = coalesce(v.relation_mcp, "uni/infra/mcpIfP-default")
      relation_monitoring    = coalesce(v.relation_monitoring, "uni/infra/moninfra-default")
      relation_mtu_policy    = coalesce(v.relation_mtu_policy, "uni/fabric/l2pol-default")
      relation_netflow       = (v.relation_netflow != null ? v.relation_netflow : "")
      relation_qos_dpp       = coalesce(v.relation_qos_dpp, "uni/infra/qosdpppol-default")
      relation_qos_pfc       = coalesce(v.relation_qos_pfc, "uni/infra/pfc-default")
      relation_slow_drain    = coalesce(v.relation_slow_drain, "uni/infra/qossdpol-default")
      relation_span_dest     = coalesce(v.relation_span_dest, [])
      relation_span_source   = coalesce(v.relation_span_source, [])
      relation_storm_ctrl    = coalesce(v.relation_storm_ctrl, "uni/infra/stormctrlifp-default")
      relation_stp           = coalesce(v.relation_stp, "uni/infra/ifPol-default")
    }
  }

}
