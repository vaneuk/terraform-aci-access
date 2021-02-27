# spine_policy_group - ACI Spine Policy Group Terraform Module

## Usage

```hcl
module "spine_policy_group" {

  source = "terraform-aci-access//modules/spine_policy_group"

  # omitted...
}
```

This module will Create a Spine Policy Group to assign to Spine Profiles.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraSpineAccNodePGrp"
* Distinguished Name: "uni/infra/funcprof/spaccnodepgrp-default"
* GUI Location: Fabric > Access Policies > Switches > Spine Switches > Policy Groups: {name}

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
| spine\_policy\_group | Create a Spine Policy Group | <pre>map(object({<br>    bfd_ipv4_plcy   = optional(string)<br>    bfd_ipv6_plcy   = optional(string)<br>    copp_pre_filter = optional(string)<br>    copp_spine_plcy = optional(string)<br>    cdp_policy      = optional(string)<br>    description     = optional(string)<br>    lldp_policy     = optional(string)<br>    name            = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "bfd_ipv4_plcy": "default",<br>    "bfd_ipv6_plcy": "default",<br>    "cdp_policy": "default",<br>    "copp_pre_filter": "default",<br>    "copp_spine_plcy": "default",<br>    "description": "",<br>    "lldp_policy": "default",<br>    "name": "default"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| spine\_policy\_group | The output will provide the Spine Policy Group ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
