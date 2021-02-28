#--------------------------------------------------------------------------
#  Add a Description to the Virtual Port Channel default Policy Properties
#--------------------------------------------------------------------------

module "vpc_default_descr" {
  source = "../modules/vpc_default_descr"

  vpc_default_descr = {
    "description" = {
      description = "Description for the VPC Default Policy"
    }
  }

}
