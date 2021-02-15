#------------------------------------------
# Create Leaf Policy Group
#------------------------------------------

/*
API Information:
 - Class: "infraAccNodePGrp"
 - Distinguished Name: "uni/infra/funcprof/accnodepgrp-default"
GUI Location:
 - Fabric > Access Policies > Switches > Leaf Switches > Policy Groups: default
*/
resource "aci_rest" "Leaf_Policy_Group" {
  path        = "/api/node/mo/uni/infra/funcprof/accnodepgrp-default.json"
  class_name  = "infraAccNodePGrp"
  payload     = <<EOF
{
  "infraAccNodePGrp": {
    "attributes": {
      "dn": "uni/infra/funcprof/accnodepgrp-default",
      "name": "default",
      "descr": "Default Policy Group for Leaf Switches - Created by Terraform Startup Script.",
      "rn": "accnodepgrp-default"
    },
    "children": [
      {
        "infraRsMstInstPol": {
          "attributes": {
            "tnStpInstPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsTopoctrlFwdScaleProfPol": {
          "attributes": {
            "tnTopoctrlFwdScaleProfilePolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsTopoctrlFastLinkFailoverInstPol": {
          "attributes": {
            "tnTopoctrlFastLinkFailoverInstPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsL2NodeAuthPol": {
          "attributes": {
            "tnL2NodeAuthPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsIaclLeafProfile": {
          "attributes": {
            "tnIaclLeafProfileName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsEquipmentFlashConfigPol": {
          "attributes": {
            "tnEquipmentFlashConfigPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsLeafPGrpToCdpIfPol": {
          "attributes": {
            "tnCdpIfPolName": "cdp_Enabled"
          },
          "children": []
        }
      },
      {
        "infraRsLeafPGrpToLldpIfPol": {
          "attributes": {
            "tnLldpIfPolName": "lldp_Enabled"
          },
          "children": []
        }
      },
      {
        "infraRsBfdIpv4InstPol": {
          "attributes": {
            "tnBfdIpv4InstPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsBfdIpv6InstPol": {
          "attributes": {
            "tnBfdIpv6InstPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsFcInstPol": {
          "attributes": {
            "tnFcInstPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsPoeInstPol": {
          "attributes": {
            "tnPoeInstPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsFcFabricPol": {
          "attributes": {
            "tnFcFabricPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsMonNodeInfraPol": {
          "attributes": {
            "tnMonInfraPolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsNetflowNodePol": {
          "attributes": {
            "tnNetflowNodePolName": "default"
          },
          "children": []
        }
      },
      {
        "infraRsLeafCoppProfile": {
          "attributes": {
            "tnCoppLeafProfileName": "default"
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
