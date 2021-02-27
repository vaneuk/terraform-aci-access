#=============================
#  Global Policies
#=============================
module "global_policies" {
  depends_on = [module.domains]
  source     = "../modules/policies_global"

  #-------------------------------------------------------------------------------------------------------------------
  aaep = {
    "access" = {
      description = "access AAEP Policy"
      domain      = module.domains.layer3["l3out"]
      # name        = "access" is already the default
    }
    "l3out" = {
      description = "l3out AAEP Policy"
      domain      = module.domains.physical["access"]
      name        = "l3out"
    }
  }
}

output "global_policies" {
  value = { for v in sort(keys(module.global_policies)) : v => module.global_policies[v] }
}

#=============================
#  Interface Policies
#=============================
module "intf_policies" {
  source = "../modules/policies_interface"

  #-------------------------------------------------------------------------------------------------------------------
  cdp = {
    "cdp_disabled" = {
      admin_state = "disabled"
      name        = "cdp_disabled"
    }
    "cdp_enabled" = {
      # admin_state   = "enabled" is already the default
      # name          = "cdp_enabled" is already the default
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  fc_interface = {
    "auto_f_port" = {
      # automaxspeed  = "32G" is already the default
      description = "FC Interface Policy for Auto Speed, F Port, trunk-off" # There is no default description
      # fill_pattern  = "IDLE" is already the default
      # name          = "auto_f_port" is already the default
      # port_mode     = "f" is already the default
      # rx_bb_credit  = 64 is already the default
      # speed         = "auto" is already the default
      # trunk_mode    = "trunk-off" is already the default
    }
    "auto_f_trunk" = {
      description = "FC Interface Policy for Auto Speed, F Port, trunk-on"
      name        = "auto_f_trunk"
      trunk_mode  = "trunk-on"
    }
    "auto_np_port" = {
      description = "FC Interface Policy for Auto Speed, NP Port, trunk-off"
      port_mode   = "np"
      name        = "auto_np_port"
    }
    "auto_np_trunk" = {
      description = "FC Interface Policy for Auto Speed, NP Port, trunk-on"
      name        = "auto_np_trunk"
      port_mode   = "np"
      trunk_mode  = "trunk-on"
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  l2_interface = {
    "default" = {
      description = "Default L2 Policy for QnQ/VLAN Scope" # There is no default description
      # name          = "default" is already the default
      # qinq          = "disabled" is already the default
      # vepa          = "disabled" is already the default
      # vlan_scope    = global is already the default
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  lacp = {
    "lacp_active" = {
      ctrl        = ["susp-individual", "load-defer", "graceful-conv"]
      description = "LACP Default Active Policy" # There is no default description
      # max_links   = 16 is already the default
      # min_links   = 1 is already the default
      # name        = "lacp_active" is already the default
      # mode        = "active" is already the default
    }
    "lacp_mac_pin" = {
      ctrl        = ["susp-individual", "load-defer", "graceful-conv"]
      description = "LACP Default MAC PIN Policy"
      name        = "lacp_mac_pin"
      mode        = "mac-pin"
    }
    "lacp_mac_pin_nicload" = {
      ctrl        = ["susp-individual", "load-defer", "graceful-conv"]
      description = "LACP Default MAC Pin Nic Load Policy"
      name        = "lacp_mac_pin_nicload"
      mode        = "mac-pin"
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  link_level = {
    "inherit_auto" = {
      # inherit_auto means it will accept the default speed for the optic in the interface and run negotiation
      # auto_neg      = "on" is already the default
      description = "Inherit Auto Link Level Policy... Same as default" # There is no default description
      # fec_mode      = "inherit" is already the default. fec_mode is for 25G/100G Optics... Please refer to https://www.cisco.com/c/en/us/td/docs/switches/datacenter/aci/apic/sw/kb/b_Cisco_ACI_and_Forward_Error_Correction.html for further information
      # link_debounce = 100 is already the default.
      # name          = "inherit_auto" is already the default
      # speed         = "inherit" is already the default
    }
    "inherit_noneg" = {
      auto_neg    = "off"
      description = "inherit no-negotiate Link Level Policy"
      name        = "inherit_noneg"
    }
    "1g_auto" = {
      description = "10G auto negotiation Link Level Policy"
      name        = "1g_auto"
      speed       = "1G"
    }
    "1g_noneg" = {
      auto_neg    = "off"
      description = "10G no-negotiate Link Level Policy"
      name        = "1g_noneg"
      speed       = "1G"
    }
    "10g_auto" = {
      description = "10G auto negotiation Link Level Policy"
      name        = "10g_auto"
      speed       = "10G"
    }
    "10g_noneg" = {
      auto_neg    = "off"
      description = "10G no-negotiate Link Level Policy"
      name        = "10g_noneg"
      speed       = "10G"
    }
    "25g_auto" = {
      description = "25G auto negotiation Link Level Policy"
      name        = "25g_auto"
      speed       = "25G"
    }
    "25g_noneg" = {
      auto_neg    = "off"
      description = "25G no-negotiate Link Level Policy.  Spectrum is Cool"
      name        = "25g_noneg"
      speed       = "25G"
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  lldp = {
    "lldp_both_disabled" = {
      admin_rx_st = "disabled"
      admin_tx_st = "disabled"
      description = "Policy to disable RX and TX of the LLDP Protocol"
      name        = "lldp_both_disabled"
    }
    "lldp_both_enabled" = {
      # admin_rx_st   = "enabled" is already the default
      # admin_tx_st   = "enabled" is already the default
      description = "Policy to enable RX and TX of the LLDP Protocol"
      # name          = "lldp_both_enabled"  is already the default
    }
    "lldp_rx_enabled" = {
      admin_tx_st = "disabled"
      description = "Policy to enable RX of the LLDP Protocol"
      name        = "lldp_rx_enabled"
    }
    "lldp_tx_enabled" = {
      admin_rx_st = "disabled"
      description = "Policy to enable TX of the LLDP Protocol"
      name        = "lldp_tx_enabled"
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  mcp = {
    "mcp_disabled" = {
      admin_state = "disabled"
      description = "Disabled Mis-Cabling Protocol Policy"
      name        = "mcp_disabled"
    }
    "mcp_enabled" = {
      # admin_state   = "enabled" is already the default
      description = "Enabled Mis-Cabling Protocol Policy"
      # name          = "mcp_enabled" is already the default
    }
  }

  #-------------------------------------------------------------------------------------------------------------------
  stp = {
    "bpdu_ft_gd" = {
      ctrl        = "bpdu-filter, bpdu-guard"
      description = "STP Policy with BPDU Filter and Guard Enabled"
      # name          = "bpdu_ft_gd" is already the default
    }
    "bpdu_ft" = {
      ctrl        = "bpdu-filter"
      description = "STP Policy with BPDU Filter Enabled"
      name        = "bpdu_ft"
    }
    "bpdu_gd" = {
      ctrl        = "bpdu-guard"
      description = "STP Policy with BPDU Guard Enabled"
      name        = "bpdu_ft"
    }
    "bpdu_no_ft_gd" = {
      # ctrl          = "" is already the default
      description = "STP Policy with BPDU Filter and Guard Disabled"
      name        = "bpdu_ft"
    }
  }
}

output "intf_policies" {
  value = { for v in sort(keys(module.intf_policies)) : v => module.intf_policies[v] }
}

