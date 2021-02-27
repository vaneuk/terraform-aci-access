# leaf_profile_dual - Leaf Profile with two Leaf Selectors Terraform Module

## Usage

```hcl
module "leaf_profile_dual" {

  source = "terraform-aci-access//modules/leaf_profile_dual"

  # omitted...
}
```

This module will Configure a Leaf Profile for two switch blocks.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraLeafS"
* Distinguished Name: "uni/infra/nprof-{Name}"
* GUI Location: Fabric > Access Policies > Switches > Leaf Switches > Profiles > {Name}

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
| [aci_leaf_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/leaf_profile) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| leaf\_profile | Create Leaf Profile. | <pre>map(object({<br>    annotation                = optional(string)<br>    description               = optional(string)<br>    name                      = optional(string)<br>    name_alias                = optional(string)<br>    node_block1_from          = optional(number)<br>    node_block1_name          = optional(string)<br>    node_block1_to            = optional(number)<br>    node_block2_from          = optional(number)<br>    node_block2_name          = optional(string)<br>    node_block2_to            = optional(number)<br>    leaf_selector_name_1      = optional(string)<br>    leaf_selector_name_2      = optional(string)<br>    leaf_interface_profile    = optional(string)<br>    switch_association_type_1 = optional(string)<br>    switch_association_type_2 = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "leaf_interface_profile": "",<br>    "leaf_selector_name_1": "leaf201",<br>    "leaf_selector_name_2": "leaf202",<br>    "name": "default",<br>    "name_alias": "",<br>    "node_block1_from": 201,<br>    "node_block1_name": "blk1",<br>    "node_block1_to": 201,<br>    "node_block2_from": 202,<br>    "node_block2_name": "blk2",<br>    "node_block2_to": 202,<br>    "switch_association_type_1": "range",<br>    "switch_association_type_2": "range"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| leaf\_profile | Leaf Profile ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
