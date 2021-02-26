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
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spine\_policy\_group | Create a Spine Policy Group | <pre>map(object({<br>    bfd_ipv4_plcy   = optional(string)<br>    bfd_ipv6_plcy   = optional(string)<br>    copp_pre_filter = optional(string)<br>    copp_spine_plcy = optional(string)<br>    cdp_policy      = optional(string)<br>    lldp_policy     = optional(string)<br>    description     = optional(string)<br>    name            = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "bfd_ipv4_plcy": "default",<br>    "bfd_ipv6_plcy": "default",<br>    "cdp_policy": "default",<br>    "copp_pre_filter": "default",<br>    "copp_spine_plcy": "default",<br>    "description": "",<br>    "lldp_policy": "default",<br>    "name": "default"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| spine\_policy\_group | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
