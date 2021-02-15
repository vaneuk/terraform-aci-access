#------------------------------------------
# Create VLAN Pools
#------------------------------------------

/*
API Information:
 - Class: "infraHPortS"
 - Distinguished Name: " uni/infra/accportprof-{Switch_Name}/hports-{Interface_Selector}-typ-range"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {Switch_Name}:{Interface_Selector}
*/
resource "aci_access_port_selector" "port_selector" {
    depends_on                        = [aci_leaf_interface_profile.default]
    leaf_interface_profile_dn        = aci_leaf_interface_profile.default.id
    description                        = "{Description}"
    name                            = "{Interface_Selector}"
    access_port_selector_type        = "range"
    relation_infra_rs_acc_base_grp    = "{DN_Policy_Group}"
}

/*
API Information:
 - Class: "infraPortBlk"
 - Distinguished Name: " uni/infra/accportprof-{Switch_Name}/hports-{Interface_Selector}-typ-range/portblk-{Interface_Selector}"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {Switch_Name}:{Interface_Selector}
*/
resource "aci_access_port_block" "port_block" {
    depends_on                = [aci_access_port_selector.selector]
    access_port_selector_dn    = aci_access_port_selector.selector.id
    description                = "{Description}"
    name                    = "{Interface_Selector}"
    from_card                = "{Module}"
    from_port                = "{Port}"
    to_card                    = "{Module}"
    to_port                    = "{Port}"
}

/*
API Information:
{%- if Port_Type == 'access' %}
 - Class: "infraAccPortGrp"
 - Distinguished Name: "uni/infra/funcprof/accportgrp-{Policy_Group}"{% endif %}
{%- if Port_Type == 'bundle' %}
 - Class: "infraAccBndlGrp"
 - Distinguished Name: "uni/infra/funcprof/accbundle-{Policy_Group}"{% endif %}
GUI Location:
{%- if Port_Type == 'access' %}
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Policy Groups > {PG_Type}: {Policy_Group}{% endif %}
{%- if Port_Type == 'bundle' %}
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface: {Policy_Group}{% endif %}
*/
data "{Resource_Type}" "{PG_Type}_{Policy_Group}" {
    name    = "{Policy_Group}"
}

/*
API Information:
 - Class: "infraRsAccBaseGrp"
 - Distinguished Name: "uni/infra/accportprof-{Name}/hports-{Interface_Selector}-typ-range/rsaccBaseGrp"
GUI Location:
 - Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {Name} > {Interface_Selector}:{Policy_Group}
*/
resource "aci_rest" "pg_{Name}_{Interface_Selector}" {
    depends_on  = [{Resource_Type}.{resc_descr}_{Policy_Group}]
    path        = "/api/node/mo/uni/infra/accportprof-{Name}/hports-{Interface_Selector}-typ-range/rsaccBaseGrp.json"
    class_name    = "infraRsAccBaseGrp"
    payload        = <<EOF
{
    "infraRsAccBaseGrp": {
        "attributes": {
            "tDn": "uni/infra/funcprof/{Port_Type}-{Policy_Group}"
        },
        "children": []
    }
}
    EOF
}
