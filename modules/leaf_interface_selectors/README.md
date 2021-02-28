# leaf_interface_selector - ACI Leaf Interface Selectors Terraform Module

## Usage

```hcl
module "leaf_interface_selector" {

  source = "terraform-aci-access//modules/leaf_interface_selector"

  # omitted...
}
```

This module will Create leaf Interface Selectors for a Leaf Interface Profile.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraHPortS"
* Distinguished Name: "uni/infra/accportprof-{leaf_name}/hports-{interface_selector}-typ-{selector_type}"
* GUI Location: Fabric > Access Policies > Interfaces > Leaf Interfaces > Profiles > {leaf_name}:{interface_selector}

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
| [aci_access_port_selector](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/access_port_selector) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| leaf\_interface\_selectors | Create a Leaf Interface Selector | <pre>map(object({<br>    annotation    = optional(string)<br>    description   = optional(string)<br>    leaf_profile  = optional(string)<br>    name          = optional(string)<br>    name_alias    = optional(string)<br>    policy_group  = optional(string)<br>    selector_type = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "leaf_profile": "",<br>    "name": "Eth1-01",<br>    "name_alias": "",<br>    "policy_group": "",<br>    "selector_type": "range"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| leaf\_interface\_selectors | This output will provide the Leaf Interface Selector ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
