variable "compartment_ocid" {
  description = "Compartment OCID where the example will create resources."
  type        = string
}

variable "function1_id" {
  description = "OCI Function OCID used for the first route."
  type        = string
}

variable "function2_id" {
  description = "OCI Function OCID used for the second route."
  type        = string
}
