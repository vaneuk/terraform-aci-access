terraform {
  experiments = [module_variable_optional_attrs]
}

variable "vpc_default_descr" {
  description = "Add a Description to the Virtual Port Channel default Policy Properties"
  type = map(object({
    description = optional(string)
  }))
  default = {
    default = {
      description = ""
    }
  }
}

locals {
  vpc_default_descr = {
    for k, v in var.vpc_default_descr : k => {
      description = (v.description != null ? v.description : "")
    }
  }
}
