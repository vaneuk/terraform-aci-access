# fabric_membership - Fabric Membership Terraform Module

## Usage

```hcl
module "fabric_membership" {

  source = "terraform-aci-access//modules/fabric_membership"

  # omitted...
}
```

This module will Configure the Smart CallHome Policies for the ACI Fabric.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricNode"
* Distinguished Name: "topology/pod-{pod_id}/node-{node_id}"
* GUI Location: Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]

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
| [aci_fabric_node_member](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/fabric_node_member) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| membership | Add Leaf/Spine to Fabric Inventory | <pre>map(object({<br>    annotation  = optional(string)<br>    ext_pool_id = optional(string)<br>    fabric_id   = optional(number)<br>    name        = optional(string)<br>    name_alias  = optional(string)<br>    node_id     = optional(number)<br>    node_type   = optional(string)<br>    pod_id      = optional(number)<br>    role        = optional(string)<br>    serial      = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "ext_pool_id": "",<br>    "fabric_id": 1,<br>    "name": "leaf201",<br>    "name_alias": "",<br>    "node_id": 201,<br>    "node_type": "unspecified",<br>    "pod_id": 1,<br>    "role": "leaf",<br>    "serial": "TEP-1-101"<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| leaf\_profile | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
