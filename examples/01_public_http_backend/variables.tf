variable "compartment_ocid" {
  description = "Compartment OCID where the example will create resources."
  type        = string
}

variable "backend_url" {
  description = "HTTP backend URL exposed through the API Gateway."
  type        = string
  default     = "https://httpbin.org/status/200"
}
