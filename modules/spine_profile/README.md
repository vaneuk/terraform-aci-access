# spine_profile - Spine Profile Terraform Module

## Usage

```hcl
module "spine_profile" {

  source = "terraform-aci-access//modules/spine_profile"

  # omitted...
}
```

This module will Configure a Spine Profile.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraSpineP"
* Distinguished Name: "uni/infra/spprof-{Name}"
* GUI Location: Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}

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
| [aci_spine_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_profile) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spine\_profile | Create Spine Profile. | <pre>map(object({<br>    annotation              = optional(string)<br>    description             = optional(string)<br>    name                    = optional(string)<br>    name_alias              = optional(string)<br>    spine_interface_profile = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "default",<br>    "name_alias": "",<br>    "spine_interface_profile": ""<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| spine\_profile | Spine Profile ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
