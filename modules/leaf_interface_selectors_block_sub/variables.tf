terraform {
  experiments = [module_variable_optional_attrs]
}

variable "port_block_sub" {
  description = "Assign Physical Port(s) to a Leaf Interface Selector"
  type = map(object({
    annotation         = optional(string)
    description        = optional(string)
    interface_selector = optional(string)
    module_from        = optional(number)
    module_to          = optional(number)
    name               = optional(string)
    name_alias         = optional(string)
    port_from          = optional(number)
    port_to            = optional(number)
    sub_port_from      = optional(number)
    sub_port_to        = optional(number)
  }))
  default = {
    default = {
      annotation         = ""
      description        = ""
      interface_selector = ""
      module_from        = 1
      module_to          = 1
      name               = "Eth1-1"
      name_alias         = ""
      port_from          = 1
      port_to            = 1
      sub_port_from      = 1
      sub_port_to        = 1
    }
  }
}

locals {
  port_block_sub = {
    for k, v in var.port_block_sub : k => {
      annotation         = (v.annotation != null ? v.annotation : "")
      description        = (v.description != null ? v.description : "")
      interface_selector = (v.interface_selector != null ? v.interface_selector : "")
      module_from        = coalesce(v.module_from, 1)
      module_to          = coalesce(v.module_to, 1)
      name               = coalesce(v.name, "Eth1-1")
      name_alias         = (v.name_alias != null ? v.name_alias : "")
      port_from          = coalesce(v.port_from, 1)
      port_to            = coalesce(v.port_to, 1)
      sub_port_from      = coalesce(v.sub_port_from, 1)
      sub_port_to        = coalesce(v.sub_port_to, 1)
    }
  }
}
