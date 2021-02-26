# interface_policy_groups - ACI Interface Policy Groups Terraform Module

## Usage

```hcl
module "interface_policy_groups" {

  source = "terraform-aci-access//modules/interface_policy_groups"

  # omitted...
}
```

This module will Add NTP Servers to the default Date and Time Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**Access Policy Group:**

* Class: "infraAccPortGrp"
* Distinguished Name: "uni/infra/funcprof/accportgrp-{Name}"
* GUI Location: Fabric > Interfaces > Leaf Interfaces > Policy Groups > Leaf Access Port > {Name}

**Breakout Policy Group:**

* Class: "infraBrkoutPortGrp"
* Distinguished Name: "uni/infra/funcprof/brkoutportgrp-{Name}"
* GUI Location: Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:{Name}

**Bundle [port-channel|vpc] Policy Group:**

* Class: "infraAccBndlGrp"
* Distinguished Name: "uni/infra/funcprof/accbundle-{Name}"
* GUI Location: Fabric > Interfaces > Leaf Interfaces > Policy Groups > [PC or VPC] Interface > {Name}

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
| [aci_leaf_access_bundle_policy_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/leaf_access_bundle_policy_group) |
| [aci_leaf_access_port_policy_group](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/leaf_access_port_policy_group) |
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| fc\_interface | Create Fibre-Channel Interface Policies. | <pre>map(object({<br>    automaxspeed = optional(string)<br>    annotation   = optional(string)<br>    description  = optional(string)<br>    fill_pattern = optional(string)<br>    name         = optional(string)<br>    name_alias   = optional(string)<br>    port_mode    = optional(string)<br>    rx_bb_credit = optional(number)<br>    speed        = optional(string)<br>    trunk_mode   = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "automaxspeed": "32G",<br>    "description": "",<br>    "fill_pattern": "IDLE",<br>    "name": "Auto_f_port",<br>    "name_alias": "",<br>    "port_mode": "f",<br>    "rx_bb_credit": 64,<br>    "speed": "auto",<br>    "trunk_mode": "trunk-off"<br>  }<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
