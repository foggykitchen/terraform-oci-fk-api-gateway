output "gateway_endpoint" {
  description = "Base API Gateway deployment endpoint."
  value       = module.fk_api_gateway.deployment_endpoint
}

output "route_endpoints" {
  description = "Resolved route endpoints for this example."
  value       = module.fk_api_gateway.route_endpoints
}
