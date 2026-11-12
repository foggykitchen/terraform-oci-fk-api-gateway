# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_resource "oci_apigateway_deployment" {
    defaults = { "endpoint" = "mock-value", "id" = "MOCK_OCID_DEPLOYMENT", "lifecycle_details" = "mock-value", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_apigateway_gateway" {
    defaults = { "hostname" = "mock-value", "id" = "MOCK_OCID_GATEWAY", "ip_addresses" = [{ "ip_address" = "10.0.0.10" }], "lifecycle_details" = "mock-value", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
}
variables {
  name             = "compatibility"
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
  subnet_id        = "MOCK_OCID_SUBNET"
  routes           = [{ "name" = "health", "path" = "/health", "methods" = ["GET"], "backend" = { "type" = "HTTP_BACKEND", "url" = "https://example.com" } }]
}

run "oci9_plan" {
  command = plan
}
