#-----------------------------
#  dc1-leaf201
#-----------------------------

module "dc1-leaf201_membership" {
  source = "../modules/fabric_membership"
  membership = {
    "dc1-leaf201" = {
      # fabric_id   = 1 # is already the default
      name = "dc1-leaf201"
      # node_id     = 201 # is already the default
      # node_type   = "unspecified" # is already the default
      # pod_id      = 1 # is already the default
      # role        = "leaf" # is already the default
      # serial      = "TEP-1-101" # is already the default
    }
  }
}

output "dc1-leaf201_membership" {
  value = { for v in sort(keys(module.dc1-leaf201_membership)) : v => module.dc1-leaf201_membership[v] }
}

module "dc1-leaf201_interface_profile" {
  source = "../modules/leaf_interface_profile"
  leaf_interface_profile = {
    "dc1-leaf201" = {
      description = "dc1-leaf201 Interface Profile"
      name        = "dc1-leaf201"
    }
  }
}

output "dc1-leaf201_interface_profile" {
  value = { for v in sort(keys(module.dc1-leaf201_interface_profile)) : v => module.dc1-leaf201_interface_profile[v] }
}

module "dc1-leaf201_leaf_profile" {
  source     = "../modules/leaf_profile_single"
  depends_on = [module.dc1-leaf201_interface_profile]
  leaf_profile = {
    "dc1-leaf201" = {
      description            = "dc1-leaf201 Leaf Profile"
      name                   = "dc1-leaf201"
      leaf_interface_profile = module.dc1-leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      leaf_selector_name     = "dc1-leaf201"
      # switch_association_type = "range" # is already the default
      node_block_name = "dc1-leaf201"
      # node_block_from         = 201 # is already the default
      # node_block_to           = 201 # is already the default
    }
  }
}

module "dc1-leaf201_policy_group" {
  source     = "../modules/leaf_profile_to_pg"
  depends_on = [module.dc1-leaf201_interface_profile, module.leaf_policy_group]
  leaf_profile_policy_group = {
    "policy_group" = {
      leaf_profile_name  = "dc1-leaf201"
      leaf_policy_group  = module.leaf_policy_group.leaf_policy_group["default"]
      leaf_selector_name = "dc1-leaf201"
      # switch_association_type = "range" # is already the default
    }
  }
}

module "dc1-leaf201_interface_selectors" {
  source     = "../modules/leaf_interface_selectors"
  depends_on = [module.leaf_interface_policy_groups, module.dc1-leaf201_interface_profile]
  leaf_interface_selectors = {
    "Eth1-01" = {
      description  = "dc1-leaf201 Eth1/1 to endpointxyz"
      leaf_profile = module.dc1-leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      name         = "Eth1-01"
      policy_group = module.leaf_interface_policy_groups.access["access"]
      # selector_type = "range" # range is already the default
    }
    "Eth1-02" = {
      description  = "dc1-leaf201 Eth1/2 to server"
      leaf_profile = module.dc1-leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      name         = "Eth1-02"
      policy_group = module.leaf_interface_policy_groups.bundle["server_vpc"]
      # selector_type = "range" # range is already the default
    }
    "Eth1-49" = {
      description  = "dc1-leaf201 Eth1/49 Breakout Port"
      leaf_profile = module.dc1-leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      name         = "Eth1-49"
      policy_group = module.leaf_interface_policy_groups.breakout["25g-4x"]
      # selector_type = "range" # range is already the default
    }
    "Eth1-49-1" = {
      description  = "dc1-leaf201 Eth1/49 Breakout Port"
      leaf_profile = module.dc1-leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      name         = "Eth1-49-1"
      policy_group = module.leaf_interface_policy_groups.access["access"]
      # selector_type = "range" # range is already the default
    }
    "Eth1-49-2" = {
      description  = "dc1-leaf201 Eth1/49 Breakout Port"
      leaf_profile = module.dc1-leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      name         = "Eth1-49-2"
      policy_group = module.leaf_interface_policy_groups.bundle["server_vpc"]
      # selector_type = "range" # range is already the default
    }
  }
}

output "dc1-leaf201_interface_selectors" {
  value = { for v in sort(keys(module.dc1-leaf201_interface_selectors)) : v => module.dc1-leaf201_interface_selectors[v] }
}

module "dc1-leaf201_interface_blocks" {
  source     = "../modules/leaf_interface_selectors_block"
  depends_on = [module.dc1-leaf201_interface_selectors]
  port_block = {
    "Eth1-01" = {
      description        = "Connection to endpointxyz" # This is what you will see on a "show interface status"
      interface_selector = module.dc1-leaf201_interface_selectors.leaf_interface_selectors["Eth1-01"]
      name               = "Eth1-01"
      # module_from        = 1  # Module 1 is already the default
      # module_to          = 1  # If the module_to is the same as the module_from you can leave this blank
      # port_from          = 1  # Port 1 is already the default
      # port_to            = 1  # If the port_to is the same as the port_from you can leave this blank
    }
    "Eth1-02" = {
      description        = "Connection to server1" # This is what you will see on a "show interface status"
      interface_selector = module.dc1-leaf201_interface_selectors.leaf_interface_selectors["Eth1-02"]
      name               = "Eth1-02"
      port_from          = 2
      # port_to            = 2  # If the port_to is the same as the port_from you can leave this blank
    }
    "Eth1-49" = {
      description        = "Breakout Port 1/49" # This is what you will see on a "show interface status"
      interface_selector = module.dc1-leaf201_interface_selectors.leaf_interface_selectors["Eth1-49"]
      name               = "Eth1-49"
      port_from          = 49
      # port_to            = 49 # If the port_to is the same as the port_from you can leave this blank
    }
  }
}

module "dc1-leaf201_interface_sub_blocks" {
  source     = "../modules/leaf_interface_selectors_block_sub"
  depends_on = [module.dc1-leaf201_interface_selectors]
  port_block_sub = {
    "Eth1-49-1" = {
      description        = "Connection to endpointzyx" # This is what you will see on a "show interface status"
      interface_selector = module.dc1-leaf201_interface_selectors.leaf_interface_selectors["Eth1-49-1"]
      # module_from         = 1 # Module 1 is already the default
      # module_to           = 1 # If the module_to is the same as the module_from you can leave this blank
      name      = "Eth1-49-1"
      port_from = 49
      # port_to            = 49 # If the port_to is the same as the port_from you can leave this blank
      # sub_port_from       = 1 # Sub-port 1 is already the default
      # sub_port_to         = 1 # Sub-port 1 is already the default
    }
    "Eth1-49-2" = {
      description        = "Connection to endpointzyx" # This is what you will see on a "show interface status"
      interface_selector = module.dc1-leaf201_interface_selectors.leaf_interface_selectors["Eth1-49-2"]
      name               = "Eth1-49-2"
      port_from          = 49
      # port_to            = 49 # If the port_to is the same as the port_from you can leave this blank
      sub_port_from = 2
      # sub_port_to        = 2  # If the sub_port_to is the same as the sub_port_from you can leave this blank
    }
  }
}
