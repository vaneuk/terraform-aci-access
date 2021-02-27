terraform {
  experiments = [module_variable_optional_attrs]
}

variable "spine_port" {
  description = "Create Access Policy Groups."
  type = map(object({
    annotation             = optional(string)
    description            = optional(string)
    name                   = optional(string)
    name_alias             = optional(string)
    relation_aaep          = optional(string)
    relation_cdp           = optional(string)
    relation_copp          = optional(string)
    relation_link_level    = optional(string)
    relation_macsec_policy = optional(string)
  }))
  default = {
    default = {
      annotation             = ""
      description            = ""
      name                   = "default"
      name_alias             = ""
      relation_aaep          = "uni/infra/attentp-default"
      relation_cdp           = "uni/infra/cdpIfP-default"
      relation_copp          = "uni/infra/coppifpol-default"
      relation_link_level    = "uni/infra/hintfpol-default"
      relation_macsec_policy = "uni/infra/macsecifp-default"
    }
  }
}

locals {

  spine_port = {
    for k, v in var.spine_port : k => {
      annotation             = (v.annotation != null ? v.annotation : "")
      description            = (v.description != null ? v.description : "")
      name                   = coalesce(v.name, "default")
      name_alias             = (v.name_alias != null ? v.name_alias : "")
      relation_aaep          = coalesce(v.relation_aaep, "uni/infra/attentp-default")
      relation_cdp           = coalesce(v.relation_cdp, "uni/infra/cdpIfP-cdp_enabled")
      relation_copp          = coalesce(v.relation_copp, "uni/infra/coppifpol-default")
      relation_link_level    = coalesce(v.relation_link_level, "uni/infra/hintfpol-default")
      relation_macsec_policy = coalesce(v.relation_link_level, "uni/infra/macsecifp-default")
    }
  }

}
