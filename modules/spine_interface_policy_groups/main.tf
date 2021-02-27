#------------------------------------------
# Create Spine Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraSpAccPortGrp"
 - Distinguished Name: " uni/infra/funcprof/spaccportgrp-{Name}"
GUI Location:
 - Fabric > Interfaces > Spine Interfaces > Policy Groups > {Name}
*/
resource "aci_spine_port_policy_group" "spine_port" {
  for_each                        = local.spine_port
  annotation                      = each.value["annotation"]
  description                     = each.value["description"]
  name                            = each.value["name"]
  name_alias                      = each.value["name_alias"]
  relation_infra_rs_att_ent_p     = each.value["relation_aaep"]          # class: infraAttEntityP    DN: "uni/infra/attentp-{Name}"
  relation_infra_rs_cdp_if_pol    = each.value["relation_cdp"]           # class: cdpIfPol           DN: "uni/infra/cdpIfP-{Name}"
  relation_infra_rs_copp_if_pol   = each.value["relation_copp"]          # class: coppIfPol          DN: "uni/infra/coppifpol-{Name}"
  relation_infra_rs_h_if_pol      = each.value["relation_link_level"]    # class: fabricHIfPol       DN: "uni/infra/hintfpol-{Name}"
  relation_infra_rs_macsec_if_pol = each.value["relation_macsec_policy"] # class: macsecIfPol        DN: "uni/infra/macsecifp-{Name}"
}

