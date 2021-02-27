# spine_profile_sw_assoc - Spine Profile Switch Association Terraform Module

## Usage

```hcl
module "spine_profile_sw_assoc" {

  source = "terraform-aci-access//modules/spine_profile_sw_assoc"

  # omitted...
}
```

This module will Assign Spine Nodes and Spine Interface Profile to a Spine Profile.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**Spine Switch Association:**

* Class: "infraSpineS"
* Distinguished Name: "uni/infra/spprof-{name}/spines-{name}-typ-{switch_association_type}"
* GUI Location: Fabric > Access Policies > Switches > Spine Switches > Profiles > {name}: Spine Selectors [{name}]

**Spine Port Selector:**

* Class: "infraRsSpAccPortP"
* Distinguished Name: "uni/infra/spaccportprof-{Name}"
* GUI Location: Fabric > Access Policies > Switches > Spine Switches > Profiles > {Name}: Spine Interface Selector Profiles: {Name}

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
| [aci_spine_switch_association](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_switch_association) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| spine\_switch\_association | Assign Spine Nodes and Spine Interface Profile to a Spine Profile. | <pre>map(object({<br>    annotation              = optional(string)<br>    description             = optional(string)<br>    name                    = optional(string)<br>    name_alias              = optional(string)<br>    node_block_from         = optional(number)<br>    node_block_to           = optional(number)<br>    spine_policy_group      = optional(string)<br>    spine_profile_dn        = optional(string)<br>    switch_association_type = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "name": "default",<br>    "name_alias": "",<br>    "node_block_from": 101,<br>    "node_block_to": 101,<br>    "spine_policy_group": "",<br>    "spine_profile_dn": "",<br>    "switch_association_type": "range"<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
