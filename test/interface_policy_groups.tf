#=======================================
#  Fabric Interface Policy Groups
#=======================================

module "interface_policy_groups" {
  source     = "../modules/interface_policy_groups"
  depends_on = [module.intf_policies]
  access = {
    "access" = {
      # Anything not defined I am accepting the default values.
      description         = "Acess Port Policy Group."
      name                = "access"
      relation_aaep       = module.global_policies.aaep["access"]
      relation_cdp        = module.intf_policies.cdp["cdp_enabled"]
      relation_link_level = module.intf_policies.link_level["inherit_auto"]
      relation_lldp       = module.intf_policies.lldp["lldp_both_enabled"]
      relation_mcp        = module.intf_policies.mcp["mcp_enabled"]
      relation_stp        = module.intf_policies.stp["bpdu_ft_gd"]
    }
  }
  breakout = {
    "10g-4x" = {} # Everything is already default for this policy.
    "25g-4x" = {
      breakout_map = "25g-4x"
      description  = "default 4x25G Breakout Policy."
      name         = "25g-4x"
    }
    "50g-8x" = {
      breakout_map = "50g-8x"
      description  = "default 8x50G Breakout Policy."
      name         = "50g-8x"
    }
    "100g-2x" = {
      breakout_map = "100g-2x"
      description  = "default 2x100G Breakout Policy."
      name         = "100g-2x"
    }
    "100g-4x" = {
      breakout_map = "100g-4x"
      description  = "default 4x100G Breakout Policy."
      name         = "100g-4x"
    }
  }
  bundle = {
    "server_vpc" = {
      # Anything not defined I am accepting the default values.
      description         = "VPC to Server Device"
      name                = "server_vpc"
      relation_aaep       = module.global_policies.aaep["access"]
      relation_cdp        = module.intf_policies.cdp["cdp_enabled"]
      relation_lacp       = module.intf_policies.lacp["lacp_active"]
      relation_link_level = module.intf_policies.link_level["inherit_auto"]
      relation_lldp       = module.intf_policies.lldp["lldp_both_enabled"]
      relation_mcp        = module.intf_policies.mcp["mcp_enabled"]
      relation_stp        = module.intf_policies.stp["bpdu_ft_gd"]
    }
  }
}

output "interface_policy_groups" {
  value = { for v in sort(keys(module.interface_policy_groups)) : v => module.interface_policy_groups[v] }
}
