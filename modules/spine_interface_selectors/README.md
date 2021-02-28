# spine_interface_selector - ACI Spine Interface Selectors Terraform Module

## Usage

```hcl
module "spine_interface_selector" {

  source = "terraform-aci-access//modules/spine_interface_selector"

  # omitted...
}
```

This module will Create Spine Interface Selectors for a Spine Interface Profile.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraSHPortS"
* Distinguished Name: "uni/infra/spaccportprof-{name}/shports-{interface_selector}-typ-range"
* GUI Location: Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > {Spine Interface Profile}:{Spine Interface Selector}

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
| spine\_interface\_selectors | Create a Spine Interface Selector | <pre>map(object({<br>    annotation_block    = optional(string)<br>    annotation_selector = optional(string)<br>    descr_block         = optional(string)<br>    descr_selector      = optional(string)<br>    module_from         = optional(number)<br>    module_to           = optional(number)<br>    name_block          = optional(string)<br>    name_selector       = optional(string)<br>    name_alias_block    = optional(string)<br>    name_alias_selector = optional(string)<br>    policy_group        = optional(string)<br>    port_from           = optional(number)<br>    port_to             = optional(number)<br>    selector_type       = optional(string)<br>    spine_profile       = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation_block": "",<br>    "annotation_selector": "",<br>    "descr_block": "",<br>    "descr_selector": "",<br>    "module_from": 1,<br>    "module_to": 1,<br>    "name_alias_block": "",<br>    "name_alias_selector": "",<br>    "name_block": "=same as name_selector",<br>    "name_selector": "Eth1-01",<br>    "policy_group": "",<br>    "port_from": 1,<br>    "port_to": 1,<br>    "selector_type": "range",<br>    "spine_profile": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| spine\_interface\_selectors | This output will provide the Spine Interface Selector ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
