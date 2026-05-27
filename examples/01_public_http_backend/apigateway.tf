module "fk_api_gateway" {
  source = "../../"

  name             = "fk-http-gateway"
  compartment_ocid = var.compartment_ocid
  subnet_id        = module.fk_vcn.subnet_ids["apigw_public"]
  path_prefix      = "/v1"

  routes = [
    {
      name    = "demo"
      path    = "/demo"
      methods = ["GET"]
      backend = {
        type = "HTTP_BACKEND"
        url  = "http://${module.loadbalancer.load_balancer_private_ips[0]}"
      }
    }
  ]
}
