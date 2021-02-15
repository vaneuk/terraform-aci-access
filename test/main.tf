#=============================
#  VLAN POOL SECTION
#=============================
module "vlan_pools" {
	source  = "../modules/pools_vlan"
	vlan_pool = {
	  "access" = {
	    name        = "access"
		description	= "Basic Static VLAN Pool"
	  },
	  "dynamic" = {
	    alloc_mode  = "dynamic"
		description	= "VMM Integration VLAN Pool"
	    name        = "dynamic"
	  },
	  "inband" = {
		description	= "Inband Management VLAN Pool"
	    name        = "inband"
	  },
	  "l3out" = {
		description	= "L3Out VLAN Pool"
	    name        = "l3out"
	  },
	  "msite" = {
		description	= "Multi-Site VLAN Pool"
		name_alias	= "MSite"
	  }
	}
}

output "vlan_pool_id" {
  value = { for p in sort(keys(module.vlan_pools)) : p => module.vlan_pools[p] }
}

module "add_vlans" {
	source  = "../modules/add_vlan"
	add_vlan = {
	  "access" = {
	    name        = "access"
	  },
	  "dynamic" = {
	    alloc_mode  = "dynamic"
	    name        = "dynamic"
	  },
	  "inband" = {
	    name        = "inband"
	  },
	  "l3out" = {
	    name        = "l3out"
	  },
	  "msite" = { }
	}
}
