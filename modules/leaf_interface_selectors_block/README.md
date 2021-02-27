# leaf_selector_block - ACI Leaf Selector Interface Block Terraform Module

## Usage

```hcl
module "leaf_selector_block" {

  source = "terraform-aci-access//modules/leaf_selector_block"

  # omitted...
}
```

Use this module to Assign Physical Port(s) to a Leaf Interface Selector.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraPortBlk"
* Distinguished Name: " uni/infra/accportprof-{leaf_name}/hports-{interface_selector}-typ-range/portblk-{block_name}"
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
| [aci_access_port_block](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/access_port_block) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| port\_block | Assign Physical Port(s) to a Leaf Interface Selector | <pre>map(object({<br>    annotation         = optional(string)<br>    description        = optional(string)<br>    interface_selector = optional(string)<br>    module_from        = optional(number)<br>    module_to          = optional(number)<br>    name               = optional(string)<br>    name_alias         = optional(string)<br>    port_from          = optional(number)<br>    port_to            = optional(number)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "interface_selector": "",<br>    "module_from": 1,<br>    "module_to": 1,<br>    "name": "Eth1-1",<br>    "name_alias": "",<br>    "port_from": 1,<br>    "port_to": 1<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
