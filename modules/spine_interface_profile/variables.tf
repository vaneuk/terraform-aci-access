terraform {
  experiments = [module_variable_optional_attrs]
}

variable "spine_interface_profile" {
  description = "Create Spine Interface Profile."
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
      name        = "spine101" # Spine Interface Profile Name
      name_alias  = ""
    }
  }
}

locals {

  spine_interface_profile = {
    for k, v in var.spine_interface_profile : k => {
      annotation  = (v.annotation != null ? v.annotation : "")
      description = (v.description != null ? v.description : "")
      name        = coalesce(v.name, "spine101")
      name_alias  = (v.name_alias != null ? v.name_alias : "")
    }
  }

}
