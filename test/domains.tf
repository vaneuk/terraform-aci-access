#=============================
#  Domains
#=============================
# module "domains" {
#   source  = "../modules/domains"
#   layer3_domain = {
#     "l3out" = {
#       description = "L3Out Domain Policy"
#       vlan_pool   = module.vlan_pools["l3out"]
#     },
#   physical_domain = {
#     "access" = {
#       name        = "access"
#       description = "Access Domain Policy"
#       vlan_pool   = module.vlan_pools["access"]
#     }
#   }
# }

