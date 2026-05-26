locals {
  gateway_display_name    = coalesce(var.gateway_display_name, var.name)
  deployment_display_name = coalesce(var.deployment_display_name, "${var.name}-deployment")
}

resource "oci_apigateway_gateway" "this" {
  compartment_id = var.compartment_ocid
  endpoint_type  = var.endpoint_type
  subnet_id      = var.subnet_id
  display_name   = local.gateway_display_name
  defined_tags   = var.defined_tags
  freeform_tags  = var.freeform_tags
}

resource "oci_apigateway_deployment" "this" {
  compartment_id = var.compartment_ocid
  gateway_id     = oci_apigateway_gateway.this.id
  path_prefix    = var.path_prefix
  display_name   = local.deployment_display_name
  defined_tags   = var.defined_tags
  freeform_tags  = var.freeform_tags

  specification {
    dynamic "routes" {
      for_each = var.routes

      content {
        path    = routes.value.path
        methods = routes.value.methods

        backend {
          type        = routes.value.backend.type
          function_id = try(routes.value.backend.function_id, null)
          url         = try(routes.value.backend.url, null)
        }
      }
    }
  }
}
