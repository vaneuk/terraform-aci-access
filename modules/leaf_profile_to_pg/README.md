# leaf_profile_to_pg - ACI Leaf Policy Group to Leaf Profile Terraform Module

## Usage

```hcl
module "leaf_profile_to_pg" {

  source = "terraform-aci-access//modules/leaf_profile_to_pg"

  # omitted...
}
```

This module will add a configured Leaf Policy Group to a Leaf Profile - Leaf Selector.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "infraLeafS"
* Class: "infraRsAccNodePGrp"
* Distinguished Name: "uni/infra/nprof-{name}/leaves-{name}-typ-range"
* GUI Location: Fabric > Access Policies > Switches > Leaf Switches > Profiles > {name}: Leaf Selectors Policy Group: {name}

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
| leaf\_profile\_policy\_group | Assign Leaf Policy Group to | <pre>map(object({<br>    leaf_policy_group       = optional(string)<br>    leaf_profile_name       = optional(string)<br>    leaf_selector_name      = optional(string)<br>    switch_association_type = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "leaf_policy_group": "",<br>    "leaf_profile_name": "leaf201",<br>    "leaf_selector_name": "leaf201",<br>    "switch_association_type": "range"<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
