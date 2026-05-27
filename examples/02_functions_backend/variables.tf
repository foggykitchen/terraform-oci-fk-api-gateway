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

variable "ocir_user_name" {
  description = "OCI Registry username used for docker login."
  type        = string
}

variable "ocir_user_password" {
  description = "OCI Registry auth token or password used for docker login."
  type        = string
  sensitive   = true
}

variable "fncustom1_message" {
  description = "Custom response message returned by the first function."
  type        = string
  default     = "Here is function fncustom1!"
}

variable "fncustom2_message" {
  description = "Custom response message returned by the second function."
  type        = string
  default     = "Here is function fncustom2!"
}
