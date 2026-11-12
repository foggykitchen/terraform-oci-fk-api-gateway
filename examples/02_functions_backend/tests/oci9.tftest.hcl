# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "local" {
}
mock_provider "null" {
}
mock_provider "oci" {
  mock_data "oci_core_services" {
    defaults = { "id" = "MOCK_OCID_SERVICES", "services" = [{ "cidr_block" = "all-fra-services-in-oracle-services-network", "description" = "mock-value", "id" = "mock-service", "name" = "All FRA Services In Oracle Services Network" }] }
  }
  mock_data "oci_identity_region_subscriptions" {
    defaults = { "id" = "MOCK_OCID_SUBSCRIPTIONS", "region_subscriptions" = [{ "is_home_region" = true, "region_key" = "FRA", "region_name" = "eu-frankfurt-1", "state" = "AVAILABLE", "tenancy_id" = "MOCK_OCID_MOCK", "status" = "READY" }] }
  }
  mock_data "oci_identity_regions" {
    defaults = { "id" = "MOCK_OCID_REGIONS", "regions" = [{ "key" = "FRA", "name" = "eu-frankfurt-1" }, { "key" = "AMS", "name" = "eu-amsterdam-1" }] }
  }
  mock_data "oci_objectstorage_namespace" {
    defaults = { "id" = "MOCK_OCID_NAMESPACE", "namespace" = "mocknamespace" }
  }
  mock_resource "oci_apigateway_deployment" {
    defaults = { "endpoint" = "mock-value", "id" = "MOCK_OCID_DEPLOYMENT", "lifecycle_details" = "mock-value", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_apigateway_gateway" {
    defaults = { "hostname" = "mock-value", "id" = "MOCK_OCID_GATEWAY", "ip_addresses" = [{ "ip_address" = "10.0.0.10" }], "lifecycle_details" = "mock-value", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_artifacts_container_repository" {
    defaults = { "billable_size_in_gbs" = "mock-value", "created_by" = "mock-value", "id" = "MOCK_OCID_REPOSITORY", "image_count" = 1, "layer_count" = 1, "layers_size_in_bytes" = "mock-value", "namespace" = "mocknamespace", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_last_pushed" = "mock-value" }
  }
  mock_resource "oci_core_dhcp_options" {
    defaults = { "id" = "MOCK_OCID_OPTIONS", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_internet_gateway" {
    defaults = { "id" = "MOCK_OCID_GATEWAY", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_nat_gateway" {
    defaults = { "id" = "MOCK_OCID_GATEWAY", "nat_ip" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_route_table" {
    defaults = { "id" = "MOCK_OCID_TABLE", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_security_list" {
    defaults = { "id" = "MOCK_OCID_LIST", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_service_gateway" {
    defaults = { "block_traffic" = false, "id" = "MOCK_OCID_GATEWAY", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_subnet" {
    defaults = { "id" = "MOCK_OCID_SUBNET", "ipv6virtual_router_ip" = "mock-value", "state" = "AVAILABLE", "subnet_domain_name" = "mock-value", "time_created" = "mock-value", "virtual_router_ip" = "mock-value", "virtual_router_mac" = "mock-value" }
  }
  mock_resource "oci_core_vcn" {
    defaults = { "byoipv6cidr_blocks" = ["mock-value"], "default_dhcp_options_id" = "MOCK_OCID_MOCK", "default_route_table_id" = "MOCK_OCID_MOCK", "default_security_list_id" = "MOCK_OCID_MOCK", "id" = "MOCK_OCID_VCN", "ipv6cidr_blocks" = ["mock-value"], "state" = "AVAILABLE", "time_created" = "mock-value", "vcn_domain_name" = "mock-value" }
  }
  mock_resource "oci_core_virtual_network" {
    defaults = { "byoipv6cidr_blocks" = ["mock-value"], "default_dhcp_options_id" = "MOCK_OCID_MOCK", "default_route_table_id" = "MOCK_OCID_MOCK", "default_security_list_id" = "MOCK_OCID_MOCK", "id" = "MOCK_OCID_NETWORK", "ipv6cidr_blocks" = ["mock-value"], "state" = "AVAILABLE", "time_created" = "mock-value", "vcn_domain_name" = "mock-value" }
  }
  mock_resource "oci_functions_application" {
    defaults = { "id" = "MOCK_OCID_APPLICATION", "state" = "AVAILABLE", "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_functions_function" {
    defaults = { "compartment_id" = "MOCK_OCID_COMPARTMENT", "id" = "MOCK_OCID_FUNCTION", "invoke_endpoint" = "mock-value", "shape" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_identity_dynamic_group" {
    defaults = { "id" = "MOCK_OCID_GROUP", "inactive_state" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_identity_policy" {
    defaults = { "ETag" = "mock-value", "id" = "MOCK_OCID_POLICY", "inactive_state" = "mock-value", "lastUpdateETag" = "mock-value", "policyHash" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_logging_log" {
    defaults = { "compartment_id" = "MOCK_OCID_COMPARTMENT", "id" = "MOCK_OCID_LOG", "state" = "AVAILABLE", "tenancy_id" = "MOCK_OCID_MOCK", "time_created" = "mock-value", "time_last_modified" = "mock-value" }
  }
  mock_resource "oci_logging_log_group" {
    defaults = { "id" = "MOCK_OCID_GROUP", "state" = "AVAILABLE", "time_created" = "mock-value", "time_last_modified" = "mock-value" }
  }
}
mock_provider "oci" {
  alias = "homeregion"
  mock_data "oci_core_services" {
    defaults = { "id" = "MOCK_OCID_SERVICES", "services" = [{ "cidr_block" = "all-fra-services-in-oracle-services-network", "description" = "mock-value", "id" = "mock-service", "name" = "All FRA Services In Oracle Services Network" }] }
  }
  mock_data "oci_identity_region_subscriptions" {
    defaults = { "id" = "MOCK_OCID_SUBSCRIPTIONS", "region_subscriptions" = [{ "is_home_region" = true, "region_key" = "FRA", "region_name" = "eu-frankfurt-1", "state" = "AVAILABLE", "tenancy_id" = "MOCK_OCID_MOCK", "status" = "READY" }] }
  }
  mock_data "oci_identity_regions" {
    defaults = { "id" = "MOCK_OCID_REGIONS", "regions" = [{ "key" = "FRA", "name" = "eu-frankfurt-1" }, { "key" = "AMS", "name" = "eu-amsterdam-1" }] }
  }
  mock_data "oci_objectstorage_namespace" {
    defaults = { "id" = "MOCK_OCID_NAMESPACE", "namespace" = "mocknamespace" }
  }
  mock_resource "oci_apigateway_deployment" {
    defaults = { "endpoint" = "mock-value", "id" = "MOCK_OCID_DEPLOYMENT", "lifecycle_details" = "mock-value", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_apigateway_gateway" {
    defaults = { "hostname" = "mock-value", "id" = "MOCK_OCID_GATEWAY", "ip_addresses" = [{ "ip_address" = "10.0.0.10" }], "lifecycle_details" = "mock-value", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_artifacts_container_repository" {
    defaults = { "billable_size_in_gbs" = "mock-value", "created_by" = "mock-value", "id" = "MOCK_OCID_REPOSITORY", "image_count" = 1, "layer_count" = 1, "layers_size_in_bytes" = "mock-value", "namespace" = "mocknamespace", "state" = "AVAILABLE", "system_tags" = {}, "time_created" = "mock-value", "time_last_pushed" = "mock-value" }
  }
  mock_resource "oci_core_dhcp_options" {
    defaults = { "id" = "MOCK_OCID_OPTIONS", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_internet_gateway" {
    defaults = { "id" = "MOCK_OCID_GATEWAY", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_nat_gateway" {
    defaults = { "id" = "MOCK_OCID_GATEWAY", "nat_ip" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_route_table" {
    defaults = { "id" = "MOCK_OCID_TABLE", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_security_list" {
    defaults = { "id" = "MOCK_OCID_LIST", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_service_gateway" {
    defaults = { "block_traffic" = false, "id" = "MOCK_OCID_GATEWAY", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_core_subnet" {
    defaults = { "id" = "MOCK_OCID_SUBNET", "ipv6virtual_router_ip" = "mock-value", "state" = "AVAILABLE", "subnet_domain_name" = "mock-value", "time_created" = "mock-value", "virtual_router_ip" = "mock-value", "virtual_router_mac" = "mock-value" }
  }
  mock_resource "oci_core_vcn" {
    defaults = { "byoipv6cidr_blocks" = ["mock-value"], "default_dhcp_options_id" = "MOCK_OCID_MOCK", "default_route_table_id" = "MOCK_OCID_MOCK", "default_security_list_id" = "MOCK_OCID_MOCK", "id" = "MOCK_OCID_VCN", "ipv6cidr_blocks" = ["mock-value"], "state" = "AVAILABLE", "time_created" = "mock-value", "vcn_domain_name" = "mock-value" }
  }
  mock_resource "oci_core_virtual_network" {
    defaults = { "byoipv6cidr_blocks" = ["mock-value"], "default_dhcp_options_id" = "MOCK_OCID_MOCK", "default_route_table_id" = "MOCK_OCID_MOCK", "default_security_list_id" = "MOCK_OCID_MOCK", "id" = "MOCK_OCID_NETWORK", "ipv6cidr_blocks" = ["mock-value"], "state" = "AVAILABLE", "time_created" = "mock-value", "vcn_domain_name" = "mock-value" }
  }
  mock_resource "oci_functions_application" {
    defaults = { "id" = "MOCK_OCID_APPLICATION", "state" = "AVAILABLE", "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_functions_function" {
    defaults = { "compartment_id" = "MOCK_OCID_COMPARTMENT", "id" = "MOCK_OCID_FUNCTION", "invoke_endpoint" = "mock-value", "shape" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value", "time_updated" = "mock-value" }
  }
  mock_resource "oci_identity_dynamic_group" {
    defaults = { "id" = "MOCK_OCID_GROUP", "inactive_state" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_identity_policy" {
    defaults = { "ETag" = "mock-value", "id" = "MOCK_OCID_POLICY", "inactive_state" = "mock-value", "lastUpdateETag" = "mock-value", "policyHash" = "mock-value", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
  mock_resource "oci_logging_log" {
    defaults = { "compartment_id" = "MOCK_OCID_COMPARTMENT", "id" = "MOCK_OCID_LOG", "state" = "AVAILABLE", "tenancy_id" = "MOCK_OCID_MOCK", "time_created" = "mock-value", "time_last_modified" = "mock-value" }
  }
  mock_resource "oci_logging_log_group" {
    defaults = { "id" = "MOCK_OCID_GROUP", "state" = "AVAILABLE", "time_created" = "mock-value", "time_last_modified" = "mock-value" }
  }
}
variables {
  tenancy_ocid       = "MOCK_OCID_TENANCY"
  user_ocid          = "MOCK_OCID_MOCK"
  fingerprint        = "compatibility"
  private_key_path   = "/unused-by-mock"
  region             = "eu-frankfurt-1"
  compartment_ocid   = "MOCK_OCID_COMPARTMENT"
  ocir_user_name     = "compatibility"
  ocir_user_password = "MockOnlyPassword123!"
}

run "oci9_plan" {
  command   = plan
  providers = { local = local, null = null, oci = oci, oci.homeregion = oci.homeregion }
}
