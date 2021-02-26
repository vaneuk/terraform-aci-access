#=============================
#  Domains
#=============================

module "domains" {
  depends_on = [module.vlan_pools]
  source     = "../modules/domains"
  layer3_domain = {
    "l3out" = {
      description = "L3Out Domain Policy"
      # name        = "l3out" is already the default
      vlan_pool = module.vlan_pools.vlan_pool["l3out"]
    }
  }
  physical_domain = {
    "access" = {
      description = "Access Domain Policy"
      # name        = "access" is already the default
      vlan_pool = module.vlan_pools.vlan_pool["access"]
    }
  }
}

output "domains" {
  value = { for v in sort(keys(module.domains)) : v => module.domains[v] }
}
