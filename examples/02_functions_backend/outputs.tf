output "gateway_endpoint" {
  description = "Base API Gateway deployment endpoint."
  value       = module.fk_api_gateway.deployment_endpoint
}

output "route_endpoints" {
  description = "Resolved route endpoints for this example."
  value       = module.fk_api_gateway.route_endpoints
}

output "functions_application_ocid" {
  description = "Shared OCI Functions application OCID."
  value       = module.oci_fk_custom_function_1.oci_app_fn.fn_app_ocid
}

output "function_ocids" {
  description = "OCI Function OCIDs created by the example."
  value = {
    fncustom1 = module.oci_fk_custom_function_1.oci_app_fn.fn_ocid
    fncustom2 = module.oci_fk_custom_function_2.oci_app_fn.fn_ocid
  }
}
