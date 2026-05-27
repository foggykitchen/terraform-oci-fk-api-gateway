output "gateway_endpoint" {
  description = "Base API Gateway deployment endpoint."
  value       = module.fk_api_gateway.deployment_endpoint
}

output "route_endpoints" {
  description = "Resolved route endpoints for this example."
  value       = module.fk_api_gateway.route_endpoints
}

output "load_balancer_private_ips" {
  description = "Private IP addresses assigned to the OCI Load Balancer."
  value       = module.loadbalancer.load_balancer_private_ips
}

output "backend_instance_private_ips" {
  description = "Private IP addresses of the backend compute instances."
  value       = [for instance in module.compute : instance.instance_private_ip]
}
