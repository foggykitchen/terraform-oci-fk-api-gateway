variable "tenancy_ocid" {
  description = "OCI tenancy OCID."
  type        = string
}

variable "user_ocid" {
  description = "OCI user OCID."
  type        = string
}

variable "fingerprint" {
  description = "OCI API key fingerprint."
  type        = string
}

variable "private_key_path" {
  description = "Path to the OCI API private key."
  type        = string
}

variable "region" {
  description = "OCI region."
  type        = string
}

variable "compartment_ocid" {
  description = "Compartment OCID where the example will create resources."
  type        = string
}

variable "instance_count" {
  description = "Number of backend compute instances attached to the load balancer."
  type        = number
  default     = 2
}
