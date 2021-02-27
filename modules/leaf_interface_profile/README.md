# leaf_interface_profile - Leaf Interface Profile Terraform Module

## Usage

```hcl
module "leaf_interface_profile" {

  source = "terraform-aci-access//modules/leaf_interface_profile"

  # omitted...
}
```

This module will Configure the Leaf Interface Profile(s) for the ACI Fabric.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraAccPortP"
* Distinguished Name: "uni/infra/accportprof-{name}"
* GUI Location: Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {name}

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
| [aci_leaf_interface_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/leaf_interface_profile) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| leaf\_interface\_profile | Create Leaf Interface Profile. | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "leaf201",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| leaf\_interface\_profile | This output will provide the Leaf Interface Profile ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
