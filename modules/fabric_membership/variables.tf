terraform {
  experiments = [module_variable_optional_attrs]
}

variable "membership" {
  description = "Add a Leaf/Spine to Fabric Inventory"
  type = map(object({
    annotation  = optional(string)
    ext_pool_id = optional(string)
    fabric_id   = optional(number)
    name        = optional(string)
    name_alias  = optional(string)
    node_id     = optional(number)
    node_type   = optional(string)
    pod_id      = optional(number)
    role        = optional(string)
    serial      = optional(string)
  }))
  default = {
    default = {
      annotation  = ""
      ext_pool_id = ""
      fabric_id   = 1
      name        = "leaf201" # Hostname for the Device
      name_alias  = ""
      node_id     = 201           # Range is between 101-4000.  Recommendation is 101-199 for Spines.. 200+ for leafs
      node_type   = "unspecified" # Options are (remote-leaf-wan|unspecified)
      pod_id      = 1             # Pod to assign the switch to.
      role        = "leaf"        # Options are (leaf|spine|unspecified)
      serial      = "TEP-1-101"   # Serial Number of the Switch
    }
  }
}

locals {

  membership = {
    for k, v in var.membership : k => {
      annotation  = (v.annotation != null ? v.annotation : "")
      ext_pool_id = (v.ext_pool_id != null ? v.ext_pool_id : "")
      fabric_id   = coalesce(v.fabric_id, 1)
      name        = coalesce(v.name, "leaf201")
      name_alias  = (v.name_alias != null ? v.name_alias : "")
      node_id     = coalesce(v.node_id, 201)
      node_type   = coalesce(v.node_type, "unspecified")
      pod_id      = coalesce(v.pod_id, 1)
      role        = coalesce(v.role, "leaf")
      serial      = coalesce(v.serial, "TEP-1-101")
    }
  }

}
