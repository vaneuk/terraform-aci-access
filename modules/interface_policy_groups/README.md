# interface_policy_groups - ACI Interface Policy Groups Terraform Module

## Usage

```hcl
module "interface_policy_groups" {

  source = "terraform-aci-access//modules/interface_policy_groups"

  # omitted...
}
```

This module will Add Leaf Policy Groups to the APIC.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**Access Policy Group:**

* Class: "infraAccPortGrp"
* Distinguished Name: "uni/infra/funcprof/accportgrp-{Name}"
* GUI Location: Fabric > Interfaces > Leaf Interfaces > Policy Groups > Leaf Access Port > {Name}

**Breakout Policy Group:**

* Class: "infraBrkoutPortGrp"
* Distinguished Name: "uni/infra/funcprof/brkoutportgrp-{Name}"
* GUI Location: Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:{Name}

**Bundle [port-channel|vpc] Policy Group:**

* Class: "infraAccBndlGrp"
* Distinguished Name: "uni/infra/funcprof/accbundle-{Name}"
* GUI Location: Fabric > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface > {Name}

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| aci | >= 0.5.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aci_leaf_access_bundle_policy_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/leaf_access_bundle_policy_group) |
| [aci_leaf_access_port_policy_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/leaf_access_port_policy_group) |
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access | Create Access Policy Groups. | <pre>map(object({<br>    annotation             = optional(string)<br>    description            = optional(string)<br>    name                   = optional(string)<br>    name_alias             = optional(string)<br>    relation_aaep          = optional(string)<br>    relation_cdp           = optional(string)<br>    relation_copp          = optional(string)<br>    relation_dwdm          = optional(string)<br>    relation_egress_dpp    = optional(string)<br>    relation_fc_interface  = optional(string)<br>    relation_ingress_dpp   = optional(string)<br>    relation_l2_intf       = optional(string)<br>    relation_l2_port_auth  = optional(string)<br>    relation_l2_port_sec   = optional(string)<br>    relation_link_level    = optional(string)<br>    relation_lldp          = optional(string)<br>    relation_macsec_policy = optional(string)<br>    relation_mcp           = optional(string)<br>    relation_monitoring    = optional(string)<br>    relation_mtu_policy    = optional(string)<br>    relation_netflow       = optional(string)<br>    relation_poe           = optional(string)<br>    relation_qos_dpp       = optional(string)<br>    relation_qos_pfc       = optional(string)<br>    relation_slow_drain    = optional(string)<br>    relation_span_dest     = optional(string)<br>    relation_span_source   = optional(string)<br>    relation_storm_ctrl    = optional(string)<br>    relation_stp           = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "default",<br>    "name_alias": "",<br>    "relation_aaep": "uni/infra/attentp-default",<br>    "relation_cdp": "uni/infra/cdpIfP-default",<br>    "relation_copp": "uni/infra/coppifpol-default",<br>    "relation_dwdm": "uni/infra/dwdmifpol-default",<br>    "relation_egress_dpp": "uni/infra/qosdpppol-default",<br>    "relation_fc_interface": "uni/infra/fcIfPol-default",<br>    "relation_ingress_dpp": "uni/infra/qosdpppol-default",<br>    "relation_l2_intf": "uni/infra/l2IfP-default",<br>    "relation_l2_port_auth": "uni/infra/portauthpol-default",<br>    "relation_l2_port_sec": "uni/infra/portsecurityP-default",<br>    "relation_link_level": "uni/infra/hintfpol-default",<br>    "relation_lldp": "uni/infra/lldpIfP-default",<br>    "relation_macsec_policy": "uni/infra/macsecifp-default",<br>    "relation_mcp": "uni/infra/mcpIfP-default",<br>    "relation_monitoring": "uni/infra/moninfra-default",<br>    "relation_mtu_policy": "uni/fabric/l2pol-default",<br>    "relation_netflow": "",<br>    "relation_poe": "",<br>    "relation_qos_dpp": "uni/infra/qosdpppol-default",<br>    "relation_qos_pfc": "uni/infra/pfc-default",<br>    "relation_slow_drain": "uni/infra/qossdpol-default",<br>    "relation_span_dest": "",<br>    "relation_span_source": "",<br>    "relation_storm_ctrl": "uni/infra/stormctrlifp-default",<br>    "relation_stp": "uni/infra/ifPol-default"<br>  }<br>}</pre> | no |
| breakout | Create Breakout Policy Groups. | <pre>map(object({<br>    annotation   = optional(string)<br>    breakout_map = optional(string)<br>    description  = optional(string)<br>    name         = optional(string)<br>    name_alias   = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "breakout_map": "10g-4x",<br>    "description": "default 4x10G Breakout Policy",<br>    "name": "10g-4x",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| bundle | Create Bundle Policy Groups. | <pre>map(object({<br>    annotation             = optional(string)<br>    description            = optional(string)<br>    lag_type               = optional(string)<br>    name                   = optional(string)<br>    name_alias             = optional(string)<br>    relation_aaep          = optional(string)<br>    relation_cdp           = optional(string)<br>    relation_copp          = optional(string)<br>    relation_dwdm          = optional(string)<br>    relation_egress_dpp    = optional(string)<br>    relation_fc_interface  = optional(string)<br>    relation_ingress_dpp   = optional(string)<br>    relation_l2_intf       = optional(string)<br>    relation_l2_port_sec   = optional(string)<br>    relation_lacp          = optional(string)<br>    relation_link_level    = optional(string)<br>    relation_lldp          = optional(string)<br>    relation_macsec_policy = optional(string)<br>    relation_mcp           = optional(string)<br>    relation_monitoring    = optional(string)<br>    relation_mtu_policy    = optional(string)<br>    relation_netflow       = optional(string)<br>    relation_qos_dpp       = optional(string)<br>    relation_qos_pfc       = optional(string)<br>    relation_slow_drain    = optional(string)<br>    relation_span_dest     = optional(string)<br>    relation_span_source   = optional(string)<br>    relation_storm_ctrl    = optional(string)<br>    relation_stp           = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "lag_type": "node",<br>    "name": "default",<br>    "name_alias": "",<br>    "relation_aaep": "uni/infra/attentp-default",<br>    "relation_cdp": "uni/infra/cdpIfP-default",<br>    "relation_copp": "uni/infra/coppifpol-default",<br>    "relation_dwdm": "uni/infra/dwdmifpol-default",<br>    "relation_egress_dpp": "uni/infra/qosdpppol-default",<br>    "relation_fc_interface": "uni/infra/fcIfPol-default",<br>    "relation_ingress_dpp": "uni/infra/qosdpppol-default",<br>    "relation_l2_intf": "uni/infra/l2IfP-default",<br>    "relation_l2_port_sec": "uni/infra/portsecurityP-default",<br>    "relation_lacp": "uni/infra/lacplagp-default",<br>    "relation_link_level": "uni/infra/hintfpol-default",<br>    "relation_lldp": "uni/infra/lldpIfP-default",<br>    "relation_macsec_policy": "uni/infra/macsecifp-default",<br>    "relation_mcp": "uni/infra/mcpIfP-default",<br>    "relation_monitoring": "uni/infra/moninfra-default",<br>    "relation_mtu_policy": "uni/fabric/l2pol-default",<br>    "relation_netflow": "",<br>    "relation_qos_dpp": "uni/infra/qosdpppol-default",<br>    "relation_qos_pfc": "uni/infra/pfc-default",<br>    "relation_slow_drain": "uni/infra/qossdpol-default",<br>    "relation_span_dest": "",<br>    "relation_span_source": "",<br>    "relation_storm_ctrl": "uni/infra/stormctrlifp-default",<br>    "relation_stp": "uni/infra/ifPol-default"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| access | This output will provide the Leaf Access Port Policy Group ID. |
| breakout | This output will provide the Breakout Policy Group ID. |
| bundle | This output will provide the Leaf Bundle (port-channel\|vpc) Port Policy Group ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
