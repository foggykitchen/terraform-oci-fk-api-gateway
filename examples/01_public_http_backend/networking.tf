module "fk_vcn" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-vcn.git?ref=v0.1.0"

  compartment_ocid = var.compartment_ocid
  name             = "fk-apigw-http-backend-vcn"
  vcn_cidr_blocks  = ["10.80.0.0/16"]

  create_internet_gateway = true
  create_nat_gateway      = true
  create_service_gateway  = true

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
    private = {
      route_rules = [
        {
          destination        = "0.0.0.0/0"
          destination_type   = "CIDR_BLOCK"
          network_entity_key = "nat_gateway"
        },
        {
          destination        = "all-services"
          destination_type   = "SERVICE_CIDR_BLOCK"
          network_entity_key = "service_gateway"
        }
      ]
    }
  }

  security_lists = {
    apigw_public = {
      ingress_rules = [
        {
          protocol = "6"
          source   = "0.0.0.0/0"
          tcp_options = {
            min = 443
            max = 443
          }
        }
      ]
      egress_rules = [
        {
          protocol    = "all"
          destination = "0.0.0.0/0"
        }
      ]
    }
    lb_private = {
      ingress_rules = [
        {
          protocol = "6"
          source   = "10.80.10.0/24"
          tcp_options = {
            min = 80
            max = 80
          }
        },
        {
          protocol = "6"
          source   = "0.0.0.0/0"
          tcp_options = {
            min = 80
            max = 80
          }
        }
      ]
      egress_rules = [
        {
          protocol    = "all"
          destination = "0.0.0.0/0"
        }
      ]
    }
    app_private = {
      ingress_rules = [
        {
          protocol = "6"
          source   = "10.80.20.0/24"
          tcp_options = {
            min = 80
            max = 80
          }
        }
      ]
      egress_rules = [
        {
          protocol    = "all"
          destination = "0.0.0.0/0"
        }
      ]
    }
  }

  subnets = {
    apigw_public = {
      display_name               = "fk-apigw-public-subnet"
      cidr_block                 = "10.80.10.0/24"
      route_table_key            = "public"
      security_list_keys         = ["apigw_public"]
      prohibit_public_ip_on_vnic = false
    }
    lb_private = {
      display_name               = "fk-apigw-lb-private-subnet"
      cidr_block                 = "10.80.20.0/24"
      route_table_key            = "private"
      security_list_keys         = ["lb_private"]
      prohibit_internet_ingress  = true
      prohibit_public_ip_on_vnic = true
    }
    app_private = {
      display_name               = "fk-apigw-app-private-subnet"
      cidr_block                 = "10.80.30.0/24"
      route_table_key            = "private"
      security_list_keys         = ["app_private"]
      prohibit_internet_ingress  = true
      prohibit_public_ip_on_vnic = true
    }
  }
}
