terraform {
    experiments = [module_variable_optional_attrs]
}

variable "cdp" {
    description = "Create CDP Interface Policies."
    type = map(object({
        admin_state   = optional(string)
        annotation    = optional(string)
        name          = optional(string)
        name_alias    = optional(string)
    }))
    default = {
        default = {
            admin_state   = "enabled" # Options are (enabled|disabled)
            annotation    = ""
            name          = "cdp_enabled"
            name_alias    = ""
        }
    }
}

variable "fc_interface" {
    description = "Create Fibre-Channel Interface Policies."
    type = map(object({
        automaxspeed  = optional(string)
        annotation    = optional(string)
        description   = optional(string)
        fill_pattern  = optional(string)
        name          = optional(string)
        name_alias    = optional(string)
        port_mode     = optional(string)
        rx_bb_credit  = optional(number)
        speed         = optional(string)
        trunk_mode    = optional(string)
    }))
    default = {
        default = {
            automaxspeed  = "32G" # Options are (4G|8G|16G|32G)
            annotation    = ""
            description   = ""
            fill_pattern  = "IDLE" # Options are (ARBFF|IDLE)
            name          = "Auto_f_port"
            name_alias    = ""
            port_mode     = "f" # Options are (f|np)
            rx_bb_credit  = 64 # Range is 16-64
            speed         = "auto" # Options are (auto|4G|8G|16G|32G)
            trunk_mode    = "trunk-off" # Options are (auto|trunk-off|trunk-on)
        }
    }
}

variable "lacp" {
    description = "Create LACP Interface Policies."
    type = map(object({
        annotation    = optional(string)
        ctrl          = optional(string)
        description   = optional(string)
        max_links     = optional(number)
        min_links     = optional(number)
        name          = optional(string)
        name_alias    = optional(string)
        mode          = optional(string)
    }))
    default = {
        default = {
            annotation    = ""
            ctrl          = "\"graceful-conv\", \"load-defer\", \"susp-individual\"" # This is a list.  Options are (\"graceful-conv\"|\"fast-sel-hot-stdby\"|\"load-defer\"|\"susp-individual\"|\"symmetric-hash\")
            description   = ""
            max_links     = 16 # Range is 1-16
            min_links     = 1  # Range is 1-16
            name          = "lacp_active"
            name_alias    = ""
            mode          = "active" # Options are (active|off|mac-pin|mac-pin-nicload|passive).  Default is off
        }
    }
}

variable "link_level" {
    description = "Create Fibre-Channel Interface Policies."
    type = map(object({
        annotation    = optional(string)
        auto_neg      = optional(string)
        description   = optional(string)
        fec_mode      = optional(string)
        link_debounce = optional(number)
        name          = optional(string)
        name_alias    = optional(string)
        speed         = optional(string)
    }))
    default = {
        default = {
            annotation    = ""
            auto_neg      = "on" # Options are (on|off)
            description   = ""
            fec_mode      = "inherit" # Options are (inherit|cl74-fc-fec|cl91-rs-fec|cons16-rs-fec|disable-fec|ieee-rs-fec|kp-fec)
            link_debounce = 100 # Range is 0-5000
            name          = "inherit_auto"
            name_alias    = ""
            speed         = "inherit" # Options are (inherit|100M|1G|10G|25G|40G|50G|100G|200G|400G)
        }
    }
}

variable "lldp" {
    description = "Create LLDP Interface Policies."
    type = map(object({
        admin_rx_st   = optional(string)
        admin_tx_st   = optional(string)
        annotation    = optional(string)
        name          = optional(string)
        name_alias    = optional(string)
    }))
    default = {
        default = {
            admin_rx_st   = "enabled" # Options are (enabled|disabled)
            admin_tx_st   = "enabled" # Options are (enabled|disabled)
            annotation    = ""
            description   = ""
            name          = "lldp_both_enabled"
            name_alias    = ""
        }
    }
}

variable "mcp" {
    description = "Create Mis-Cabling Protocol Policies."
    type = map(object({
        admin_state   = optional(string)
        annotation    = optional(string)
        name          = optional(string)
        name_alias    = optional(string)
    }))
    default = {
        default = {
            admin_state   = "enabled" # Options are (enabled|disabled)
            annotation    = ""
            description   = ""
            name          = "mcp_enabled"
            name_alias    = ""
        }
    }
}

variable "bpdu" {
    description = "Create Spanning-Tree (BPDU) Interface Policies."
    type = map(object({
        annotation    = optional(string)
        ctrl          = optional(string)
        description   = optional(string)
        name          = optional(string)
        name_alias    = optional(string)
    }))
    default = {
        default = {
            annotation    = ""
            ctrl          = "\"bpdu-filter\", \"bpdu-guard\"" # This is a list.  Options are (\"bpdu-filter\"|\"bpdu-guard\")
            description   = ""
            name          = "bpdu_fg"
            name_alias    = ""
        }
    }
}

locals {
    cdp = {
        for k, v in var.cdp : k => {
            admin_state   = coalesce(v.admin_state, "enabled")
            annotation    = (v.annotation == null ? v.annotation : "")
            description   = (v.description == null ? v.description : "")
            name          = coalesce(v.name, "cdp_enabled")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
        }
    }
    fc_interface = {
        for k, v in var.cdp : k => {
            automaxspeed  = coalesce(v.automaxspeed, "32G")
            annotation    = (v.annotation == null ? v.annotation : "")
            description   = (v.description == null ? v.description : "")
            fill_pattern  = coalesce(v.fill_pattern, "IDLE")
            name          = coalesce(v.name, "Auto_f_port")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
            port_mode     = coalesce(v.port_mode, "f")
            rx_bb_credit  = coalesce(v.rx_bb_credit, 64)
            speed         = coalesce(v.speed, "auto")
            trunk_mode    = coalesce(v.trunk_mode, "trunk-off")
        }
    }
    lacp = {
        for k, v in var.cdp : k => {
            annotation    = (v.annotation == null ? v.annotation : "")
            ctrl          = coalesce(v.ctrl, "\"graceful-conv\", \"load-defer\", \"susp-individual\"")
            description   = (v.description == null ? v.description : "")
            max_links     = coalesce(v.max_links, 16)
            min_links     = coalesce(v.min_links, 1)
            name          = coalesce(v.name, "lacp_active")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
            mode          = coalesce(v.mode, "active")
        }
    }
    link_level = {
        for k, v in var.cdp : k => {
            annotation    = (v.annotation == null ? v.annotation : "")
            auto_neg      = coalesce(v.auto_neg, "on")
            description   = (v.description == null ? v.description : "")
            fec_mode      = coalesce(v.fill_pattern, "inherit")
            link_debounce = coalesce(v.fill_pattern, 100)
            name          = coalesce(v.name, "inherit_auto")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
            speed         = coalesce(v.speed, "inherit")
        }
    }
    lldp = {
        for k, v in var.cdp : k => {
            admin_rx_st   = coalesce(v.admin_state, "enabled")
            admin_tx_st   = coalesce(v.admin_state, "enabled")
            annotation    = (v.annotation == null ? v.annotation : "")
            description   = (v.description == null ? v.description : "")
            name          = coalesce(v.name, "lldp_both_enabled")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
        }
    }
    mcp = {
        for k, v in var.cdp : k => {
            admin_state   = coalesce(v.admin_state, "enabled")
            annotation    = (v.annotation == null ? v.annotation : "")
            description   = (v.description == null ? v.description : "")
            name          = coalesce(v.name, "mcp_enabled")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
        }
    }
    bpdu = {
        for k, v in var.cdp : k => {
            annotation    = (v.annotation == null ? v.annotation : "")
            ctrl          = coalesce(v.ctrl, "\"bpdu-filter\", \"bpdu-guard\"")
            description   = (v.description == null ? v.description : "")
            name          = coalesce(v.name, "bpdu_fg")
            name_alias    = (v.name_alias == null ? v.name_alias : "")
        }
    }
}
