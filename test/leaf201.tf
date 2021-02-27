#=============================
#  Leaf201
#=============================

module "leaf201_membership" {
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

output "leaf201_membership" {
  value = { for v in sort(keys(module.leaf201_membership)) : v => module.leaf201_membership[v] }
}

module "leaf201_interface_profile" {
  source = "../modules/leaf_interface_profile"
  leaf_interface_profile = {
    "dc1-leaf201" = {
      description = "dc1-leaf201 Interface Profile"
      name        = "dc1-leaf201"
    }
  }
}

output "leaf201_interface_profile" {
  value = { for v in sort(keys(module.leaf201_interface_profile)) : v => module.leaf201_interface_profile[v] }
}

module "leaf201_leaf_profile" {
  source     = "../modules/leaf_profile_single"
  depends_on = [module.leaf201_interface_profile]
  leaf_profile = {
    "dc1-leaf201" = {
      description            = "dc1-leaf201 Leaf Profile"
      name                   = "dc1-leaf201"
      leaf_interface_profile = module.leaf201_interface_profile.leaf_interface_profile["dc1-leaf201"]
      leaf_selector_name     = "dc1-leaf201"
      # switch_association_type = "range" # is already the default
      node_block_name = "dc1-leaf201"
      # node_block_from         = 201 # is already the default
      # node_block_to           = 201 # is already the default
    }
  }
}

module "leaf201_policy_group" {
  source     = "../modules/leaf_profile_to_pg"
  depends_on = [module.leaf201_interface_profile, module.leaf_policy_group]
  leaf_profile_policy_group = {
    "policy_group" = {
      leaf_profile_name  = "dc1-leaf201"
      leaf_policy_group  = module.leaf_policy_group.leaf_policy_group["default"]
      leaf_selector_name = "dc1-leaf201"
      # switch_association_type = "range" # is already the default
    }
  }
}

