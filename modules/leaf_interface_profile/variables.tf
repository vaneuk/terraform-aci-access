terraform {
  experiments = [module_variable_optional_attrs]
}

variable "leaf_interface_profile" {
  description = "Create Leaf Interface Profile."
  type = map(object({
    annotation  = optional(string)
    description = optional(string)
    name        = optional(string)
    name_alias  = optional(string)
  }))
  default = {
    default = {
      annotation  = ""
      description = ""
      name        = "leaf201" # Leaf Interface Profile Name
      name_alias  = ""
    }
  }
}

locals {

  leaf_interface_profile = {
    for k, v in var.leaf_interface_profile : k => {
      annotation  = (v.annotation != null ? v.annotation : "")
      description = (v.description != null ? v.description : "")
      name        = coalesce(v.name, "leaf201")
      name_alias  = (v.name_alias != null ? v.name_alias : "")
    }
  }

}
