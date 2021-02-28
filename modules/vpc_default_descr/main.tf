#------------------------------------------------------------------
# Add a Description to the Virtual Port Channel default Properties
#------------------------------------------------------------------

/*
API Information:
 - Class: "fabricProtPol"
 - Distinguished Name: "uni/fabric/protpol"
GUI Location:
 - Fabric > Access Policies > Policies > Switch > Virtual Port Channel default
*/
resource "aci_rest" "vpc_description" {
  for_each   = local.vpc_default_descr
  path       = "/api/node/mo/uni/fabric/protpol.json"
  class_name = "fabricProtPol"
  payload    = <<EOF
{
  "fabricProtPol": {
    "attributes": {
      "dn": "uni/fabric/protpol",
      "descr": "${each.value["description"]}"
    },
    "children": []
  }
}
	EOF
}
