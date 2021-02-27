# domains - Add Domains [Layer 3 and Physical] Terraform Module

## Usage

```hcl
module "domains" {

  source = "terraform-aci-access//modules/domains"

  # omitted...
}
```

This module will Layer 3 (L3Out) and Physical Domains to the APIC.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

Layer 3 Domain Profile:

* Class: "l3extDomP"
* Distinguished Name: "uni/l3dom-{Policy Name}"
* GUI Location: Fabric > Access Policies > Physical and External Domains > L3 Domains: {Policy Name}

Physical Domain Profile:

* Class: "physDomP"
* Distinguished Name: "uni/infra/phys-{Policy Name}"
* GUI Location: Fabric > Access Policies > Physical and External Domains > Physical Domains: {Policy Name}

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
| [aci_l3_domain_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/l3_domain_profile) |
| [aci_physical_domain](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/physical_domain) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| layer3\_domain | Create a Layer 3 Domain.  Fabric > Access Policies > Physical and External Domains > L3 Domains: {Policy Name} | <pre>map(object({<br>    annotation = optional(string)<br>    name       = optional(string)<br>    name_alias = optional(string)<br>    vlan_pool  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "name": "l3out",<br>    "name_alias": "",<br>    "vlan_pool": ""<br>  }<br>}</pre> | no |
| physical\_domain | Create a Physical Domain.  Fabric > Access Policies > Physical and External Domains > Physical Domains: {Policy Name} | <pre>map(object({<br>    annotation = optional(string)<br>    name       = optional(string)<br>    name_alias = optional(string)<br>    vlan_pool  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "name": "access",<br>    "name_alias": "",<br>    "vlan_pool": "access"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| layer3 | This output will provide the Layer 3 Domain ID. |
| physical | This output will provide the Physical Domain ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
