# pools_vlan - ACI VLAN Pools Terraform Module

## Usage

```hcl
module "pools_vlan" {

  source = "terraform-aci-access//modules/pools_vlan"

  # omitted...
}
```

This module will Create VLAN Pools.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fvnsVlanInstP"
* Distinguished Name: "uni/infra/vlanns-[{Name}]-{Allocation Mode}"
* GUI Location: Fabric > Access Policies > Pools > VLAN:[{Name}]

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
| vlan\_pool | Create a VLAN Pool | <pre>map(object({<br>    alloc_mode  = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "alloc_mode": "static",<br>    "annotation": "",<br>    "description": "",<br>    "name": "access",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| vlan\_pool | This output will provide the VLAN Pool ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
