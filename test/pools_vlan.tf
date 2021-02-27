#=============================
#  VLAN POOLs
#=============================
module "vlan_pools" {
  source = "../modules/pools_vlan"
  vlan_pool = {
    "access" = {
      description = "Standard Static VLAN Pool"
      name        = "access"
    },
    "l3out" = {
      description = "L3Out VLAN Pool"
      name        = "l3out"
    },
    "vmm_dynamic" = {
      alloc_mode  = "dynamic"
      description = "VMM Integration VLAN Pool"
      name        = "vmm_dynamic"
    }
  }
}

output "vlan_pools" {
  value = { for v in sort(keys(module.vlan_pools)) : v => module.vlan_pools[v] }
}

# module "vlan_list" {
#   depends_on  = [module.vlan_pools]
#   source      = "../modules/add_vlans"
#   vlan_list = {
#     "access" = {
#       vlan_pool   = module.vlan_pools.vlan_pool["access"]
#       from        = 1
#       to          = 99
#     },
#     "vmm_dynamic" = {
#       alloc_mode  = "dynamic"
#       vlan_pool   = module.vlan_pools.vlan_pool["vmm_dynamic"]
#       from        = 1000
#       to          = 1199
#     },
#     "l3out_1" = {
#       vlan_pool   = module.vlan_pools.vlan_pool["l3out"]
#       from        = 4
#       to          = 4
#     },
#     "l3out_2" = {
#       vlan_pool   = module.vlan_pools.vlan_pool["l3out"]
#       from        = 100
#       to          = 101
#     },
#   }
# }

# module "vlan_list" {
#   depends_on  = [module.vlan_pools]
#   source      = "../modules/add_vlans"
#   vlan_list = merge(
#     {
#       for i in range(1, 100) :
#       "access" => {
#         vlan_pool   = module.vlan_pools.vlan_pool["access"]
#         from        = i
#         to          = i
#       }...
#     },
#     {
#       for i in concat(range(1000, 1200), range(1300, 1400)) :
#       "vmm_dynamic" => {
#         alloc_mode  = "dynamic"
#         vlan_pool   = module.vlan_pools.vlan_pool["vmm_dynamic"]
#         from        = i
#         to          = i
#       }...
#     },
#     {
#       for i in list(4, 100, 101) :
#       "l3out" => {
#         vlan_pool   = module.vlan_pools.vlan_pool["l3out"]
#         from        = i
#         to          = i
#       }...
#     }
#   )
# }
