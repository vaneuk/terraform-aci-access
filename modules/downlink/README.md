# downlink - Downlink Conversion Terraform Module - aci_rest

## Usage

```hcl
module "downlink" {

  source = "terraform-aci-access//modules/downlink"

  # omitted...
}
```

This module will Convert an Uplink to a Downlink on a Leaf Switch.

## APIC Reference Information

This resource is not accessible through the API Browser.

* GUI Location: Fabric > Inventory > Topology: Interface + [Leaf] > [Highlight Port] > Select [Uplink/Downlink]
**Note:** The Conversion can only be configured when a interface selector has not been applied to the port

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
| vlan\_pool | Create a VLAN Pool | <pre>map(object({<br>    alloc_mode  = optional(string)<br>    annotation  = optional(string)<br>    description = optional(string)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "alloc_mode": "static",<br>    "annotation": "",<br>    "description": "",<br>    "name": "msite",<br>    "name_alias": ""<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
