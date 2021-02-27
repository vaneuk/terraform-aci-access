# leaf_profile_single - Leaf Profile with Single switch block Terraform Module

## Usage

```hcl
module "leaf_profile_single" {

  source = "terraform-aci-access//modules/leaf_profile_single"

  # omitted...
}
```

This module will Configure a Leaf Profile for a single switch block.

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
| leaf\_profile | Create Leaf Profile. | <pre>map(object({<br>    annotation              = optional(string)<br>    description             = optional(string)<br>    name                    = optional(string)<br>    name_alias              = optional(string)<br>    node_block_from         = optional(number)<br>    node_block_name         = optional(string)<br>    node_block_to           = optional(number)<br>    leaf_selector_name      = optional(string)<br>    leaf_interface_profile  = optional(string)<br>    switch_association_type = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "leaf_interface_profile": "",<br>    "leaf_selector_name": "leaf201",<br>    "name": "default",<br>    "name_alias": "",<br>    "node_block_from": 201,<br>    "node_block_name": "blk1",<br>    "node_block_to": 201,<br>    "switch_association_type": "range"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| leaf\_profile | Leaf Profile ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
