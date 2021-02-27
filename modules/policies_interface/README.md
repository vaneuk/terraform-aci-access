# policies_interface - ACI Fabric > Access > Policies > Interface Terraform Module

## Usage

```hcl
module "policies_interface" {

  source = "terraform-aci-access//modules/policies_interface"

  # omitted...
}
```

This module will Configure the BGP ASN and add the Route Reflectors for the ACI Fabric.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**CDP Policy:**

* Class: "cdpIfPol"
* Distinguished Name: "uni/infra/cdpIfP-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > CDP Interface : {Policy Name}"

**Fibre-Channel Interface Policy:**

* Class: "fcIfPol"
* Distinguished Name: "uni/infra/fcIfPol-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : {Policy Name}"

**L2 Interface Policy:**

* Class: "l2IfPol"
* Distinguished Name: "uni/infra/l2IfP-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > L2 Interface : {Policy Name}"

**LACP Policy:**

* Class: "lacpLagPol"
* Distinguished Name: "uni/infra/lacplagp-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > Port Channel : {Policy Name}"

**Link Level Policy:**

* Class: "fabricHIfPol"
* Distinguished Name: "uni/infra/hintfpol-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > Link Level : {Policy Name}"

**LLDP Policy:**

* Class: "lldpIfPol"
* Distinguished Name: "uni/infra/lldpIfP-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > LLDP Interface : {Policy Name}"

**MCP Policy:**

* Class: "mcpIfPol"
* Distinguished Name: "uni/infra/mcpIfP-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > MCP Interface : {Policy Name}"

**Port Security Policy:**

* Class: "l2PortSecurityPol"
* Distinguished Name: "uni/infra/portsecurityP-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > Port Security : {Policy Name}"

**STP Policy:**

* Class: "stpIfPol"
* Distinguished Name: "uni/infra/ifPol-{Policy Name}"
* GUI Location: "Fabric > Access Policies > Policies > Interface > Spanning Tree Interface : {Policy Name}"

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
| [aci_cdp_interface_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/cdp_interface_policy) |
| [aci_fabric_if_pol](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/fabric_if_pol) |
| [aci_interface_fc_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/interface_fc_policy) |
| [aci_l2_interface_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/l2_interface_policy) |
| [aci_lacp_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/lacp_policy) |
| [aci_lldp_interface_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/lldp_interface_policy) |
| [aci_miscabling_protocol_interface_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/miscabling_protocol_interface_policy) |
| [aci_port_security_policy](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/port_security_policy) |
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cdp | Create CDP Interface Policies. | <pre>map(object({<br>    admin_state = optional(string)<br>    annotation  = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "admin_state": "enabled",<br>    "annotation": "",<br>    "name": "cdp_enabled",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| fc\_interface | Create Fibre-Channel Interface Policies. | <pre>map(object({<br>    automaxspeed = optional(string)<br>    annotation   = optional(string)<br>    description  = optional(string)<br>    fill_pattern = optional(string)<br>    name         = optional(string)<br>    name_alias   = optional(string)<br>    port_mode    = optional(string)<br>    rx_bb_credit = optional(number)<br>    speed        = optional(string)<br>    trunk_mode   = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "automaxspeed": "32G",<br>    "description": "",<br>    "fill_pattern": "IDLE",<br>    "name": "auto_f_port",<br>    "name_alias": "",<br>    "port_mode": "f",<br>    "rx_bb_credit": 64,<br>    "speed": "auto",<br>    "trunk_mode": "trunk-off"<br>  }<br>}</pre> | no |
| l2\_interface | Create L2 Interface Policies.  Components are QnQ, Reflective Relay, and VLAN Scope | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>    qinq        = optional(string)<br>    vepa        = optional(string)<br>    vlan_scope  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "default",<br>    "name_alias": "",<br>    "qinq": "disabled",<br>    "vepa": "disabled",<br>    "vlan_scope": "global"<br>  }<br>}</pre> | no |
| lacp | Create LACP Interface Policies. | <pre>map(object({<br>    annotation  = optional(string)<br>    ctrl        = optional(string)<br>    description = optional(string)<br>    max_links   = optional(number)<br>    min_links   = optional(number)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>    mode        = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "ctrl": "\"graceful-conv\", \"load-defer\", \"susp-individual\"",<br>    "description": "",<br>    "max_links": 16,<br>    "min_links": 1,<br>    "mode": "active",<br>    "name": "lacp_active",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| link\_level | Create Link Level Interface Policies. | <pre>map(object({<br>    annotation    = optional(string)<br>    auto_neg      = optional(string)<br>    description   = optional(string)<br>    fec_mode      = optional(string)<br>    link_debounce = optional(number)<br>    name          = optional(string)<br>    name_alias    = optional(string)<br>    speed         = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "auto_neg": "on",<br>    "description": "",<br>    "fec_mode": "inherit",<br>    "link_debounce": 100,<br>    "name": "inherit_auto",<br>    "name_alias": "",<br>    "speed": "inherit"<br>  }<br>}</pre> | no |
| lldp | Create LLDP Interface Policies. | <pre>map(object({<br>    admin_rx_st = optional(string)<br>    admin_tx_st = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "admin_rx_st": "enabled",<br>    "admin_tx_st": "enabled",<br>    "annotation": "",<br>    "description": "",<br>    "name": "lldp_both_enabled",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| mcp | Create Mis-Cabling Protocol Policies. | <pre>map(object({<br>    admin_state = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "admin_state": "enabled",<br>    "annotation": "",<br>    "description": "",<br>    "name": "mcp_enabled",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| port\_security | Create Port Security Policies. | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    maximum     = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>    timeout     = optional(number)<br>    violation   = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "maximum": 0,<br>    "name": "default",<br>    "name_alias": "",<br>    "timeout": 60,<br>    "violation": "protect"<br>  }<br>}</pre> | no |
| stp | Create Spanning-Tree (BPDU) Interface Policies. | <pre>map(object({<br>    annotation  = optional(string)<br>    ctrl        = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "ctrl": "",<br>    "description": "",<br>    "name": "bpdu_ft_gd",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| cdp | This output will provide the CDP Policy ID. |
| fc\_interface | This output will provide the Fibre Channel Interface Policy ID. |
| l2\_interface | This output will provide the L2 Interface Policy ID. |
| lacp | This output will provide the LACP Policy ID. |
| link\_level | This output will provide the Link Level Policy ID. |
| lldp | This output will provide the LLDP Policy ID. |
| mcp | This output will provide the Miscabling Protocol Policy ID. |
| port\_security | This output will provide the Port Security Policy ID. |
| stp | This output will provide the Spanning Tree Policy ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
