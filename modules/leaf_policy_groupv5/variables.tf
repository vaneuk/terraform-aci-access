terraform {
  experiments = [module_variable_optional_attrs]
}

variable "leaf_policy_group" {
  description = "Create a Leaf Policy Group"
  type = map(object({
    bfd_ipv4_plcy      = optional(string)
    bfd_ipv6_plcy      = optional(string)
    bfd_mhop_ipv4_plcy = optional(string)
    bfd_mhop_ipv6_plcy = optional(string)
    cdp_policy         = optional(string)
    copp_leaf_plcy     = optional(string)
    copp_pre_filter    = optional(string)
    description        = optional(string)
    fc_node_policy     = optional(string)
    fc_san_policy      = optional(string)
    fast_link_plcy     = optional(string)
    flash_config       = optional(string)
    fwd_scale_plcy     = optional(string)
    lldp_policy        = optional(string)
    monitor_policy     = optional(string)
    name               = optional(string)
    netflow_node_plcy  = optional(string)
    node_8021x_plcy    = optional(string)
    poe_policy         = optional(string)
    stp_policy         = optional(string)
  }))
  default = {
    default = {
      bfd_ipv4_plcy      = "default" # Policies > Switches > BFD > BFD IPv4 > {Policy Name}
      bfd_ipv6_plcy      = "default" # Policies > Switches > BFD > BFD IPv6 > {Policy Name}
      bfd_mhop_ipv4_plcy = "default" # Policies > Switches > BFD Multihop > BFD Multihop IPv4 > {Policy Name}
      bfd_mhop_ipv6_plcy = "default" # Policies > Switches > BFD Multihop > BFD Multihop IPv6 > {Policy Name}
      cdp_policy         = "default" # Policies > Interface > CDP Interface > {Policy Name}
      copp_leaf_plcy     = "default" # Policies > Switches > CoPP Leaf > {Policy Name}
      copp_pre_filter    = "default" # Policies > Switches > CoPP Pre-Filter > {Policy Name}
      description        = ""
      fc_node_policy     = "default" # Policies > Switches > Fibre Channel Node > {Policy Name}
      fc_san_policy      = "default" # Policies > Switches > Fibre Channel SAN > {Policy Name}
      fast_link_plcy     = "default" # Policies > Switches > Fast Link Failover > {Policy Name}
      flash_config       = "default" # Policies > Switches > Equipment Flash Config Policies > {Policy Name}
      fwd_scale_plcy     = "default" # Policies > Switches > Forwarding Scale Profile > {Policy Name}
      lldp_policy        = "default" # Policies > Interface > LLDP Interface > {Policy Name}
      monitor_policy     = "default" # Policies > Monitoring > {Policy Name}
      name               = "default" # Switches > Leaf Switches > Policy Groups > {Policy Name}
      netflow_node_plcy  = "default" # Policies > Switches > Netflow Node > {Policy Name}
      node_8021x_plcy    = "default" # Policies > Switches > 802.1x Node Authentication > {Policy Name}
      poe_policy         = "default" # Policies > Switches > PoE Node > {Policy Name}
      stp_policy         = "default" # Policies > Switches > Spanning Tree > {Policy Name}
    }
  }
}

locals {
  leaf_policy_group = {
    for k, v in var.leaf_policy_group : k => {
      bfd_ipv4_plcy      = coalesce(v.bfd_ipv4_plcy, "default")
      bfd_ipv6_plcy      = coalesce(v.bfd_ipv6_plcy, "default")
      bfd_mhop_ipv4_plcy = coalesce(v.bfd_mhop_ipv4_plcy, "default")
      bfd_mhop_ipv6_plcy = coalesce(v.bfd_mhop_ipv6_plcy, "default")
      cdp_policy         = coalesce(v.cdp_policy, "default")
      copp_pre_filter    = coalesce(v.copp_pre_filter, "default")
      copp_leaf_plcy     = coalesce(v.copp_leaf_plcy, "default")
      description        = (v.description == null ? v.description : "")
      fc_node_policy     = coalesce(v.fc_node_policy, "default")
      fc_san_policy      = coalesce(v.fc_san_policy, "default")
      fast_link_plcy     = coalesce(v.fast_link_plcy, "default")
      flash_config       = coalesce(v.flash_config, "default")
      fwd_scale_plcy     = coalesce(v.fwd_scale_plcy, "default")
      lldp_policy        = coalesce(v.lldp_policy, "default")
      monitor_policy     = coalesce(v.monitor_policy, "default")
      name               = coalesce(v.name, "default")
      netflow_node_plcy  = coalesce(v.netflow_node_plcy, "default")
      node_8021x_plcy    = coalesce(v.node_8021x_plcy, "default")
      poe_policy         = coalesce(v.poe_policy, "default")
      stp_policy         = coalesce(v.stp_policy, "default")
    }
  }
}
