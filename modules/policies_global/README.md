# policies_global - Attachable Access Entity Profiles Terraform Module

## Usage

```hcl
module "policies_global" {

  source = "terraform-aci-access//modules/policies_global"

  # omitted...
}
```

This module will Create Attachable Access Entity Profiles.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraAttEntityP"
* Distinguished Name: "uni/infra/attentp-{Policy Name}"
* GUI Location: Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : {Policy Name}

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
| [aci_attachable_access_entity_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/attachable_access_entity_profile) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aaep | Create a Attachable Access Entity Profile: Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : {Policy Name} | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    domain      = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "domain": "",<br>    "name": "access",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| aaep | This output will provide the Attachable Access Entity Profile ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
