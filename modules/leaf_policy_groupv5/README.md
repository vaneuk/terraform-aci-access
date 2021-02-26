# leaf_policy_groupv4 - Leaf Policy Group Terraform Module - aci_rest

## Usage

```hcl
module "leaf_policy_groupv5" {

    source = "terraform-aci-access//modules/leaf_policy_groupv5"

    # omitted...
}
```

This module will Create a Leaf Policy Group in the ACI Fabric for 5.x and above.

* New BFD Multi-Hop Support.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraAccNodePGrp"
* Distinguished Name: "uni/infra/funcprof/accnodepgrp-{name}"
* GUI Location: Fabric > Access Policies > Switches > Leaf Switches > Policy Groups: {name}

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
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| leaf\_policy\_group | Create a Leaf Policy Group | <pre>map(object({<br>    bfd_ipv4_plcy      = optional(string)<br>    bfd_ipv6_plcy      = optional(string)<br>    bfd_mhop_ipv4_plcy = optional(string)<br>    bfd_mhop_ipv6_plcy = optional(string)<br>    cdp_policy         = optional(string)<br>    copp_leaf_plcy     = optional(string)<br>    copp_pre_filter    = optional(string)<br>    description        = optional(string)<br>    fc_node_policy     = optional(string)<br>    fc_san_policy      = optional(string)<br>    fast_link_plcy     = optional(string)<br>    flash_config       = optional(string)<br>    fwd_scale_plcy     = optional(string)<br>    lldp_policy        = optional(string)<br>    monitor_policy     = optional(string)<br>    name               = optional(string)<br>    netflow_node_plcy  = optional(string)<br>    node_8021x_plcy    = optional(string)<br>    poe_policy         = optional(string)<br>    stp_policy         = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "bfd_ipv4_plcy": "default",<br>    "bfd_ipv6_plcy": "default",<br>    "bfd_mhop_ipv4_plcy": "default",<br>    "bfd_mhop_ipv6_plcy": "default",<br>    "cdp_policy": "default",<br>    "copp_leaf_plcy": "default",<br>    "copp_pre_filter": "default",<br>    "description": "",<br>    "fast_link_plcy": "default",<br>    "fc_node_policy": "default",<br>    "fc_san_policy": "default",<br>    "flash_config": "default",<br>    "fwd_scale_plcy": "default",<br>    "lldp_policy": "default",<br>    "monitor_policy": "default",<br>    "name": "default",<br>    "netflow_node_plcy": "default",<br>    "node_8021x_plcy": "default",<br>    "poe_policy": "default",<br>    "stp_policy": "default"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| leaf\_policy\_grp | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
