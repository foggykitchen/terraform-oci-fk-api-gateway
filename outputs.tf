output "gateway_id" {
  description = "OCI API Gateway OCID."
  value       = oci_apigateway_gateway.this.id
}

output "gateway_state" {
  description = "Lifecycle state of the API Gateway."
  value       = oci_apigateway_gateway.this.state
}

output "deployment_id" {
  description = "OCI API Gateway deployment OCID."
  value       = oci_apigateway_deployment.this.id
}

output "deployment_endpoint" {
  description = "Base HTTPS endpoint exposed by the deployment."
  value       = oci_apigateway_deployment.this.endpoint
}

output "path_prefix" {
  description = "Deployment path prefix."
  value       = var.path_prefix
}

output "route_endpoints" {
  description = "Map of route name to full public endpoint."
  value = {
    for route in var.routes :
    route.name => "${oci_apigateway_deployment.this.endpoint}${local.normalized_path_prefix}${route.path}"
  }
}

output "routes" {
  description = "Route definitions echoed back with resolved public endpoints."
  value = {
    for route in var.routes :
    route.name => {
      path     = route.path
      methods  = route.methods
      endpoint = "${oci_apigateway_deployment.this.endpoint}${local.normalized_path_prefix}${route.path}"
      backend  = route.backend
    }
  }
}
