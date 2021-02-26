# vpc_domain - VPC Domain Profile Terraform Module - aci_rest

## Usage

```hcl
module "vpc_domain" {

  source = "terraform-aci-access//modules/vpc_domain"

  # omitted...
}
```

This module will Add an Explicit VPC Protection Group to the Virtual Port Channel default Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricExplicitGEp"
* Distinguished Name: "uni/fabric/protpol/expgep-{Name}"
* GUI Location: Fabric > Access Policies > Policies > Virtual Port Channel default

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
| vlan\_pool | Create a VLAN Pool | <pre>map(object({<br>    alloc_mode  = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "alloc_mode": "static",<br>    "annotation": "",<br>    "description": "",<br>    "name": "msite",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| vlan\_pool\_id | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
