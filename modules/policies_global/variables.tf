terraform {
  experiments = [module_variable_optional_attrs]
}

variable "aaep" {
  description = "Create a Attachable Access Entity Profile: Fabric > Access Policies > Policies > Global > Attachable Access Entity Profiles : {Policy Name}"
  type = map(object({
    annotation  = optional(string)
    description = optional(string)
    domain      = optional(string)
    name        = optional(string)
    name_alias  = optional(string)
  }))
  default = {
    default = {
      annotation  = ""
      description = ""
      domain      = ""
      name        = "access"
      name_alias  = ""
    }
  }
}

locals {
  aaep = {
    for k, v in var.aaep : k => {
      annotation  = (v.annotation != null ? v.annotation : "")
      description = (v.description != null ? v.description : "")
      domain      = (v.domain != null ? v.domain : "")
      name        = coalesce(v.name, "access")
      name_alias  = (v.name_alias != null ? v.name_alias : "")
    }
  }
}
