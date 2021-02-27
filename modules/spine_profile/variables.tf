terraform {
  experiments = [module_variable_optional_attrs]
}

variable "spine_profile" {
  description = "Create Spine Profile."
  type = map(object({
    annotation              = optional(string)
    description             = optional(string)
    name                    = optional(string)
    name_alias              = optional(string)
    spine_interface_profile = optional(string)
  }))
  default = {
    default = {
      annotation              = ""
      description             = ""
      name                    = "default" # Name for the Spine Profile
      name_alias              = ""
      spine_interface_profile = "" # Relationship to the Spine Interface Profile
    }
  }
}

locals {

  spine_profile = {
    for k, v in var.spine_profile : k => {
      annotation              = (v.annotation != null ? v.annotation : "")
      description             = (v.description != null ? v.description : "")
      name                    = coalesce(v.name, "spine101")
      name_alias              = (v.name_alias != null ? v.name_alias : "")
      spine_interface_profile = (v.spine_interface_profile != null ? v.spine_interface_profile : "")
    }
  }

}
