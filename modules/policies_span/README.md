# interface_policy_groups - ACI Interface Policy Groups Terraform Module

## Usage

```hcl
module "interface_policy_groups" {

  source = "terraform-aci-access//modules/interface_policy_groups"

  # omitted...
}
```

This module will Add NTP Servers to the default Date and Time Policy.

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
| [aci_span_destination_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/span_destination_group) |
| [aci_span_source_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/span_source_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cdp | Create CDP Interface Policies. | <pre>map(object({<br>    admin_state = optional(string)<br>    annotation  = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "admin_state": "enabled",<br>    "annotation": "",<br>    "name": "cdp_enabled",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| fc\_interface | Create Fibre-Channel Interface Policies. | <pre>map(object({<br>    automaxspeed = optional(string)<br>    annotation   = optional(string)<br>    description  = optional(string)<br>    fill_pattern = optional(string)<br>    name         = optional(string)<br>    name_alias   = optional(string)<br>    port_mode    = optional(string)<br>    rx_bb_credit = optional(number)<br>    speed        = optional(string)<br>    trunk_mode   = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "automaxspeed": "32G",<br>    "description": "",<br>    "fill_pattern": "IDLE",<br>    "name": "auto_f_port",<br>    "name_alias": "",<br>    "port_mode": "f",<br>    "rx_bb_credit": 64,<br>    "speed": "auto",<br>    "trunk_mode": "trunk-off"<br>  }<br>}</pre> | no |
| l2\_interface | Create LACP Interface Policies. | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>    qinq        = optional(string)<br>    vepa        = optional(string)<br>    vlan_scope  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "default",<br>    "name_alias": "",<br>    "qinq": "disabled",<br>    "vepa": "disabled",<br>    "vlan_scope": "global"<br>  }<br>}</pre> | no |
| lacp | Create LACP Interface Policies. | <pre>map(object({<br>    annotation  = optional(string)<br>    ctrl        = optional(string)<br>    description = optional(string)<br>    max_links   = optional(number)<br>    min_links   = optional(number)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>    mode        = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "ctrl": "\"graceful-conv\", \"load-defer\", \"susp-individual\"",<br>    "description": "",<br>    "max_links": 16,<br>    "min_links": 1,<br>    "mode": "active",<br>    "name": "lacp_active",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| link\_level | Create Fibre-Channel Interface Policies. | <pre>map(object({<br>    annotation    = optional(string)<br>    auto_neg      = optional(string)<br>    description   = optional(string)<br>    fec_mode      = optional(string)<br>    link_debounce = optional(number)<br>    name          = optional(string)<br>    name_alias    = optional(string)<br>    speed         = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "auto_neg": "on",<br>    "description": "",<br>    "fec_mode": "inherit",<br>    "link_debounce": 100,<br>    "name": "inherit_auto",<br>    "name_alias": "",<br>    "speed": "inherit"<br>  }<br>}</pre> | no |
| lldp | Create LLDP Interface Policies. | <pre>map(object({<br>    admin_rx_st = optional(string)<br>    admin_tx_st = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "admin_rx_st": "enabled",<br>    "admin_tx_st": "enabled",<br>    "annotation": "",<br>    "description": "",<br>    "name": "lldp_both_enabled",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| mcp | Create Mis-Cabling Protocol Policies. | <pre>map(object({<br>    admin_state = optional(string)<br>    annotation  = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "admin_state": "enabled",<br>    "annotation": "",<br>    "description": "",<br>    "name": "mcp_enabled",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| stp | Create Spanning-Tree (BPDU) Interface Policies. | <pre>map(object({<br>    annotation  = optional(string)<br>    ctrl        = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "ctrl": "",<br>    "description": "",<br>    "name": "bpdu_ft_gd",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| cdp | n/a |
| fc\_interface | n/a |
| l2\_interface | n/a |
| lacp | n/a |
| link\_level | n/a |
| lldp | n/a |
| mcp | n/a |
| stp | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
