terraform {
  experiments = [module_variable_optional_attrs]
}

variable "spine_policy_group" {
  description = "Create a Spine Policy Group"
  type = map(object({
    bfd_ipv4_plcy   = optional(string)
    bfd_ipv6_plcy   = optional(string)
    copp_pre_filter = optional(string)
    copp_spine_plcy = optional(string)
    cdp_policy      = optional(string)
    lldp_policy     = optional(string)
    description     = optional(string)
    name            = optional(string)
  }))
  default = {
    default = {
      bfd_ipv4_plcy   = "default" # Policies > Switches > BFD BFD IPv4 > {Policy Name}
      bfd_ipv6_plcy   = "default" # Policies > Switches > BFD BFD IPv6 > {Policy Name}
      copp_pre_filter = "default" # Policies > Switches > CoPP Pre-Filter > {Policy Name}
      copp_spine_plcy = "default" # Policies > Switches > CoPP Spine > {Policy Name}
      cdp_policy      = "default" # Policies > Interface > CDP Interface > {Policy Name}
      lldp_policy     = "default" # Policies > Interface > LLDP Interface > {Policy Name}
      description     = ""
      name            = "default" # Switches > Spine Switches > Policy Groups > {Policy Name}
    }
  }
}

locals {
  spine_policy_group = {
    for k, v in var.spine_policy_group : k => {
      bfd_ipv4_plcy   = coalesce(v.bfd_ipv4_plcy, "default")
      bfd_ipv6_plcy   = coalesce(v.bfd_ipv6_plcy, "default")
      copp_pre_filter = coalesce(v.copp_pre_filter, "default")
      copp_spine_plcy = coalesce(v.copp_spine_plcy, "default")
      cdp_policy      = coalesce(v.cdp_policy, "default")
      lldp_policy     = coalesce(v.lldp_policy, "default")
      description     = (v.description == null ? v.description : "")
      name            = coalesce(v.name, "default")
    }
  }
}
