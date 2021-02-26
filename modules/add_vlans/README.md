# add_vlans - Add VLANs Terraform Module

## Usage

```hcl
module "add_vlans" {

  source = "terraform-aci-access//modules/add_vlans"

  # omitted...
}
```

This module will Add VLANs to a VLAN Pool.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fvnsEncapBlk"
* Distinguished Name: "uni/infra/vlanns-[{Name}]-{Allocation_Mode}/from-[vlan-{VLAN_ID}]-to-[vlan-{VLAN_ID}]"
* GUI Location: Fabric > Access Policies > Pools > VLAN:[{Name}] > Encap Blocks

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
| [aci_ranges](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/ranges) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vlan\_list | Add VLANs to VLAN Pools | <pre>map(list(object({<br>    alloc_mode = optional(string)<br>    annotation = optional(string)<br>    from       = optional(number)<br>    name_alias = optional(string)<br>    role       = optional(string)<br>    to         = optional(number)<br>    vlan_pool  = optional(string)<br>  })))</pre> | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
