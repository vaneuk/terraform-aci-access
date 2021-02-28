# vpc_domains - ACI VPC Domain Terraform Module - aci_rest

## Usage

```hcl
module "vpc_domains" {

  source = "terraform-aci-access//modules/vpc_domains"

  # omitted...
}
```

This module will Add an Explicit VPC Protection Group to the Virtual Port Channel default Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricExplicitGEp"
* Distinguished Name: "uni/fabric/protpol/expgep-{Name}"
* GUI Location: Fabric > Access Policies > Policies > Virtual Port Channel default

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
| vpc\_domains | Create Explicit VPC Protection Group(s) | <pre>map(object({<br>    annotation_domain        = optional(string)<br>    annotation_domain_policy = optional(string)<br>    annotation_node1         = optional(string)<br>    annotation_node2         = optional(string)<br>    domain_policy            = optional(string)<br>    name                     = optional(string)<br>    name_alias_node1         = optional(string)<br>    name_alias_node2         = optional(string)<br>    node1_id                 = optional(number)<br>    node2_id                 = optional(number)<br>    pod_id                   = optional(number)<br>    vpc_domain_id            = optional(number)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation_domain": "",<br>    "annotation_domain_policy": "",<br>    "annotation_node1": "",<br>    "annotation_node2": "",<br>    "domain_policy": "default",<br>    "name": "leaf101-102-vpc",<br>    "name_alias_node1": "",<br>    "name_alias_node2": "",<br>    "node1_id": 201,<br>    "node2_id": 202,<br>    "pod_id": 1,<br>    "vpc_domain_id": 201<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
