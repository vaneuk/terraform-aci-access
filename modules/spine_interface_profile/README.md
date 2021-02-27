# spine_interface_profile - Spine Interface Profile Terraform Module

## Usage

```hcl
module "spine_interface_profile" {

  source = "terraform-aci-access//modules/spine_interface_profile"

  # omitted...
}
```

This module will Configure the Spine Interface Profile(s) for the ACI Fabric.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraSpAccPortP"
* Distinguished Name: "uni/infra/spaccportprof-{name}"
* GUI Location: Fabric > Access Policies > Interfaces > Spine Interfaces > Profiles > {name}

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
| [aci_spine_interface_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_interface_profile) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spine\_interface\_profile | Create Spine Interface Profile. | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "spine101",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| spine\_interface\_profile | This output will provide the Spine Interface Profile ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
