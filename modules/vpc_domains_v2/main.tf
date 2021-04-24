#----------------------------------------------
# Create a VPC Domain Pair
#----------------------------------------------

/*
API Information:
 - Class: "fabricExplicitGEp"
 - Distinguished Name: "uni/fabric/protpol/expgep-{Name}"
GUI Location:
 - Fabric > Access Policies > Policies > Virtual Port Channel default
*/
resource "aci_vpc_explicit_protection_group" "vpc_domains" {
  for_each                         = local.vpc_domains
  name                             = each.value["name"]
  annotation                       = each.value["annotation_domain"]
  switch1                          = each.value["node1_id"]
  switch2                          = each.value["node2_id"]
  vpc_domain_policy                = each.value["domain_policy"]
  vpc_explicit_protection_group_id = each.value["vpc_domain_id"]
}