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
| [aci_vlan_pool](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/vlan_pool) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vlan\_pool | Create a VLAN Pool | <pre>map(object({<br>    alloc_mode  = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "alloc_mode": "static",<br>    "annotation": "",<br>    "description": "",<br>    "name": "l3out",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| vlan\_pool | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
