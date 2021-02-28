# spine_interface_policy_groups - ACI Spine Interface Policy Groups Terraform Module

## Usage

```hcl
module "spine_interface_policy_groups" {

  source = "terraform-aci-access//modules/spine_interface_policy_groups"

  # omitted...
}
```

This module will Add Spine Policy Groups to the APIC.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraSpAccPortGrp"
* Distinguished Name: "uni/infra/funcprof/spaccportgrp-{Name}"
* GUI Location: Fabric > Interfaces > Spine Interfaces > Policy Groups > {Name}

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
| [aci_spine_port_policy_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_port_policy_group) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spine\_port | Create Access Policy Groups. | <pre>map(object({<br>    annotation             = optional(string)<br>    description            = optional(string)<br>    name                   = optional(string)<br>    name_alias             = optional(string)<br>    relation_aaep          = optional(string)<br>    relation_cdp           = optional(string)<br>    relation_copp          = optional(string)<br>    relation_link_level    = optional(string)<br>    relation_macsec_policy = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "default",<br>    "name_alias": "",<br>    "relation_aaep": "uni/infra/attentp-default",<br>    "relation_cdp": "uni/infra/cdpIfP-default",<br>    "relation_copp": "uni/infra/coppifpol-default",<br>    "relation_link_level": "uni/infra/hintfpol-default",<br>    "relation_macsec_policy": "uni/infra/macsecifp-default"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| spine\_port | This output will provide the Spine Port Policy Group ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
