#=============================
#  Spine Policy Group "default"
#=============================

module "spine_policy_group" {
  source = "../modules/spine_policy_group"
  spine_policy_group = {
    "default" = {
      # bfd_ipv4_plcy     = "default" # is already the default
      # bfd_ipv6_plcy     = "default" # is already the default
      cdp_policy = "cdp_enabled" # Policy Created in the policies.tf example
      # copp_spine_plcy   = "default" # is already the default
      # copp_pre_filter   = "default" # is already the default
      description = "Default Leaf Policy Group"
      lldp_policy = "lldp_both_enabled" # Policy Created in the policies.tf example
      # name              = "default" # is already the default
    }
  }
}

output "spine_policy_group" {
  value = { for v in sort(keys(module.spine_policy_group)) : v => module.spine_policy_group[v] }
}

