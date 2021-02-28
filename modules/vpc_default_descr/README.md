# vpc_default_descr - ACI Virtual Port Channel default Policy description - aci_rest

## Usage

```hcl
module "vpc_default_descr" {

  source = "terraform-aci-access//modules/vpc_default_descr"

  # omitted...
}
```

This module will Add an Description to the Virtual Port Channel default Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricProtPol"
* Distinguished Name: "uni/fabric/protpol"
* GUI Location: Fabric > Access Policies > Policies > Switch > Virtual Port Channel default

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
| vpc\_default\_descr | Add a Description to the Virtual Port Channel default Policy Properties | <pre>map(object({<br>    description = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "description": ""<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
