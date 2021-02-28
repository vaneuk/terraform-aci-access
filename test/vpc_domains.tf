#------------------------------------------
#  Create Explicit VPC Protection Group(s)
#------------------------------------------

module "vpc_domains" {
  source = "../modules/vpc_domains"

  vpc_domains = {

    #-------------------------------------------------------------------------------------------------------------------
    "dc1-leaf201-202-vpc" = {
      domain_policy = "default"
      name          = "dc1-leaf201-202-vpc"
      node1_id      = 201
      node2_id      = 202
      pod_id        = 1
      vpc_domain_id = 201
    }
  }

}
