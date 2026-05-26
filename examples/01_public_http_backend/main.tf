module "fk_vcn" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-vcn.git?ref=v0.1.0"

  compartment_ocid = var.compartment_ocid
  name             = "fk-apigw-demo-vcn"
  vcn_cidr_blocks  = ["10.40.0.0/16"]

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
      cidr_block                 = "10.40.10.0/24"
      route_table_key            = "public"
      prohibit_public_ip_on_vnic = false
    }
  }
}

module "fk_api_gateway" {
  source = "../../"

  name             = "fk-http-gateway"
  compartment_ocid = var.compartment_ocid
  subnet_id        = module.fk_vcn.subnet_ids["apigw_public"]

  routes = [
    {
      name    = "health"
      path    = "/health"
      methods = ["GET"]
      backend = {
        type = "HTTP_BACKEND"
        url  = var.backend_url
      }
    }
  ]
}
