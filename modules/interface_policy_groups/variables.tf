terraform {
  experiments = [module_variable_optional_attrs]
}

variable "fc_interface" {
  description = "Create Fibre-Channel Interface Policies."
  type = map(object({
    automaxspeed = optional(string)
    annotation   = optional(string)
    description  = optional(string)
    fill_pattern = optional(string)
    name         = optional(string)
    name_alias   = optional(string)
    port_mode    = optional(string)
    rx_bb_credit = optional(number)
    speed        = optional(string)
    trunk_mode   = optional(string)
  }))
  default = {
    default = {
      automaxspeed = "32G" # Options are (4G|8G|16G|32G)
      annotation   = ""
      description  = ""
      fill_pattern = "IDLE" # Options are (ARBFF|IDLE)
      name         = "Auto_f_port"
      name_alias   = ""
      port_mode    = "f"         # Options are (f|np)
      rx_bb_credit = 64          # Range is 16-64
      speed        = "auto"      # Options are (auto|4G|8G|16G|32G)
      trunk_mode   = "trunk-off" # Options are (auto|trunk-off|trunk-on)
    }
  }
}


locals {
  ntp = {
    for k, v in var.ntp : k => {
      epg        = coalesce(v.epg, "default")
      mgmt       = coalesce(v.mgmt, "oob")
      ntp_server = coalesce(v.ntp_server, "198.18.1.1")
      preferred  = coalesce(v.preferred, false)
    }
  }
}
