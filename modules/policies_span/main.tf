#------------------------------------------
# Create a Span Destination Group
#------------------------------------------

/*
API Information:
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-{Policy Name}"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > CDP Interface : {Policy Name}
*/
resource "aci_span_destination_group" "example" {
  tenant_dn  = aci_tenant.example.id
  annotation = "example"
  name       = "example"
  name_alias = "example"
}

#------------------------------------------
# Create a Span Source Group
#------------------------------------------

/*
API Information:
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-{Policy Name}"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > CDP Interface : {Policy Name}
*/
resource "aci_span_source_group" "example" {
  tenant_dn  = aci_tenant.example.id
  admin_st   = "example"
  annotation = "example"
  name       = "example"
  name_alias = "example"
}

