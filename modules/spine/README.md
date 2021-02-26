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
| [aci_fabric_node_member](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/fabric_node_member) |
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |
| [aci_spine_interface_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_interface_profile) |
| [aci_spine_port_selector](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_port_selector) |
| [aci_spine_profile](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_profile) |
| [aci_spine_switch_association](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/spine_switch_association) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_group | SNMP Client Group Name | `string` | `"default_oob"` | no |
| epg | Define EPG within the Management Domain to reach these SNMP Clients | `string` | `"default"` | no |
| mgmt | Options are 'inb' or 'oob'.  Define the Management Domain to reach these SNMP Clients | `string` | `"oob"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
