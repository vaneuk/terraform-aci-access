#-----------------------------
#  dc1-spine101
#-----------------------------

module "dc1-spine101_membership" {
  source = "../modules/fabric_membership"
  membership = {
    "dc1-spine101" = {
      # fabric_id   = 1 # is already the default
      name    = "dc1-spine101"
      node_id = 101
      # node_type   = "unspecified" # is already the default
      # pod_id      = 1 # is already the default
      role   = "spine"
      serial = "TEP-1-103"
    }
  }
}

output "dc1-spine101_membership" {
  value = { for v in sort(keys(module.dc1-spine101_membership)) : v => module.dc1-spine101_membership[v] }
}

module "dc1-spine101_interface_profile" {
  source = "../modules/spine_interface_profile"
  spine_interface_profile = {
    "dc1-spine101" = {
      description = "dc1-spine101 Interface Profile"
      name        = "dc1-spine101"
    }
  }
}

output "dc1-spine101_interface_profile" {
  value = { for v in sort(keys(module.dc1-spine101_interface_profile)) : v => module.dc1-spine101_interface_profile[v] }
}

module "dc1-spine101_spine_profile" {
  source     = "../modules/spine_profile"
  depends_on = [module.dc1-spine101_interface_profile]
  spine_profile = {
    "dc1-spine101" = {
      description             = "dc1-spine101 Leaf Profile"
      name                    = "dc1-spine101"
      spine_interface_profile = module.dc1-spine101_interface_profile.spine_interface_profile["dc1-spine101"]
    }
  }
}

output "dc1-spine101_spine_profile" {
  value = { for v in sort(keys(module.dc1-spine101_spine_profile)) : v => module.dc1-spine101_spine_profile[v] }
}

module "dc1-spine101_spine_profile_sw_assoc" {
  source     = "../modules/spine_profile_sw_assoc"
  depends_on = [module.spine_policy_group, module.dc1-spine101_spine_profile]
  spine_switch_association = {
    "dc1-spine101" = {
      description = "dc1-spine101 Spine Switch Assocation"
      name        = "dc1-spine101" # This is the Spine Selectors Name and will be used for the Block Name too.
      # node_block_from         = 101 # Node 101 is already the default
      # node_block_to           = 101 # Node 101 is already the default
      spine_policy_group = module.spine_policy_group.spine_policy_group["default"]
      spine_profile_dn   = module.dc1-spine101_spine_profile.spine_profile["dc1-spine101"]
      # switch_association_type = "range" # is already the default
    }
  }
}

# module "dc1-spine101_interface_selectors" {
#   source     = "../modules/spine_interface_selectors"
#   depends_on = [module.interface_policy_groups,module.dc1-spine101_interface_profile]
#   interface_selectors = {
#     "Eth1-01" = {
#       description   = "dc1-spine101 Eth1/1 to endpointxyz"
#       spine_profile  = module.dc1-spine101_interface_profile.spine_interface_profile["dc1-spine101"]
#       name          = "Eth1-01"
#       policy_group  = module.interface_policy_groups.access["access"]
#       # selector_type = "range" # range is already the default
#     }
#     "Eth1-02" = {
#       description   = "dc1-spine101 Eth1/2 to server"
#       spine_profile  = module.dc1-spine101_interface_profile.spine_interface_profile["dc1-spine101"]
#       name          = "Eth1-02"
#       policy_group  = module.interface_policy_groups.bundle["server_vpc"]
#       # selector_type = "range" # range is already the default
#     }
#     "Eth1-49" = {
#       description   = "dc1-spine101 Eth1/49 Breakout Port"
#       spine_profile  = module.dc1-spine101_interface_profile.spine_interface_profile["dc1-spine101"]
#       name          = "Eth1-49"
#       policy_group  = module.interface_policy_groups.breakout["25g-4x"]
#       # selector_type = "range" # range is already the default
#     }
#     "Eth1-49-1" = {
#       description   = "dc1-spine101 Eth1/49 Breakout Port"
#       spine_profile  = module.dc1-spine101_interface_profile.spine_interface_profile["dc1-spine101"]
#       name          = "Eth1-49-1"
#       policy_group  = module.interface_policy_groups.access["access"]
#       # selector_type = "range" # range is already the default
#     }
#     "Eth1-49-2" = {
#       description   = "dc1-spine101 Eth1/49 Breakout Port"
#       spine_profile  = module.dc1-spine101_interface_profile.spine_interface_profile["dc1-spine101"]
#       name          = "Eth1-49-2"
#       policy_group  = module.interface_policy_groups.bundle["server_vpc"]
#       # selector_type = "range" # range is already the default
#     }
#   }
# }
#
# output "dc1-spine101_interface_selectors" {
#   value = { for v in sort(keys(module.dc1-spine101_interface_selectors)) : v => module.dc1-spine101_interface_selectors[v] }
# }

# module "dc1-spine101_interface_blocks" {
#   source     = "../modules/spine_interface_selectors_block"
#   depends_on = [module.dc1-spine101_interface_selectors]
#   port_block = {
#     "Eth1-01" = {
#       description         = "Connection to endpointxyz"
#       interface_selector  = module.dc1-spine101_interface_selectors.interface_selectors["Eth1-01"]
#       name                = "Eth1-01"
#       # module_from         = 1 # Module 1 is already the default
#       # module_to           = 1 # Module 1 is already the default
#       # port_from           = 1 # Port 1 is already the default
#       # port_to             = 1 # Port 1 is already the default
#     }
#     "Eth1-02" = {
#       description         = "Connection to server1"
#       interface_selector  = module.dc1-spine101_interface_selectors.interface_selectors["Eth1-02"]
#       name                = "Eth1-02"
#       port_from           = 2
#       port_to             = 2
#     }
#     "Eth1-49" = {
#       description         = "Breakout Port 1/49"
#       interface_selector  = module.dc1-spine101_interface_selectors.interface_selectors["Eth1-49"]
#       name                = "Eth1-49"
#       port_from           = 49
#       port_to             = 49
#     }
#   }
# }
#
# module "dc1-spine101_interface_sub_blocks" {
#   source     = "../modules/spine_interface_selectors_block_sub"
#   depends_on = [module.dc1-spine101_interface_selectors]
#   port_block_sub = {
#     "Eth1-49-1" = {
#       description         = "Connection to endpointzyx"
#       interface_selector  = module.dc1-spine101_interface_selectors.interface_selectors["Eth1-49-1"]
#       name                = "Eth1-49-1"
#       port_from           = 49
#       port_to             = 49
#       # sub_port_from       = 1 # Sub-port 1 is already the default
#       # sub_port_to         = 1 # Sub-port 1 is already the default
#     }
#     "Eth1-49-2" = {
#       description         = "Connection to endpointzyx"
#       interface_selector  = module.dc1-spine101_interface_selectors.interface_selectors["Eth1-49-2"]
#       name                = "Eth1-49-2"
#       port_from           = 49
#       port_to             = 49
#       sub_port_from       = 2
#       sub_port_to         = 2
#     }
#   }
# }
