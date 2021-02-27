#=======================================
#  Fabric Interface Policy Groups
#=======================================

module "spine_interface_policy_groups" {
  source     = "../modules/spine_interface_policy_groups"
  depends_on = [module.intf_policies]

  #-------------------------------------------------------------------------------------------------------------------
  spine_port = {
    "access" = {
      # Anything not defined I am accepting the default values.
      description         = "Acess Port Policy Group."
      name                = "msite"
      relation_aaep       = module.global_policies.aaep["l3out"]
      relation_cdp        = module.intf_policies.cdp["cdp_enabled"]
      relation_link_level = module.intf_policies.link_level["inherit_auto"]
    }
  }
}

output "spine_interface_policy_groups" {
  value = { for v in sort(keys(module.spine_interface_policy_groups)) : v => module.spine_interface_policy_groups[v] }
}
