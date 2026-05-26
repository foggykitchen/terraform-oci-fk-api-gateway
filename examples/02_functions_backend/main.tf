module "fk_vcn" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-vcn.git?ref=v0.1.0"

  compartment_ocid = var.compartment_ocid
  name             = "fk-functions-apigw-vcn"
  vcn_cidr_blocks  = ["10.41.0.0/16"]

  create_internet_gateway = true

  route_tables = {
    public = {
      route_rules = [
        {
          destination        = "0.0.0.0/0"
          destination_type   = "CIDR_BLOCK"
          network_entity_key = "internet_gateway"
        }
      ]
    }
  }

  subnets = {
    apigw_public = {
      cidr_block                 = "10.41.10.0/24"
      route_table_key            = "public"
      prohibit_public_ip_on_vnic = false
    }
  }
}

module "fk_api_gateway" {
  source = "../../"

  name             = "fk-functions-gateway"
  compartment_ocid = var.compartment_ocid
  subnet_id        = module.fk_vcn.subnet_ids["apigw_public"]
  path_prefix      = "/v1"

  routes = [
    {
      name    = "fncustom1"
      path    = "/fncustom1"
      methods = ["POST"]
      backend = {
        type        = "ORACLE_FUNCTIONS_BACKEND"
        function_id = var.function1_id
      }
    },
    {
      name    = "fncustom2"
      path    = "/fncustom2"
      methods = ["POST"]
      backend = {
        type        = "ORACLE_FUNCTIONS_BACKEND"
        function_id = var.function2_id
      }
    }
  ]
}
