variable "name" {
  description = "Base display name used for the API Gateway and deployment."
  type        = string
}

variable "compartment_ocid" {
  description = "Compartment OCID where API Gateway resources will be created."
  type        = string
}

variable "subnet_id" {
  description = "Subnet OCID used by the API Gateway."
  type        = string
}

variable "endpoint_type" {
  description = "API Gateway endpoint type."
  type        = string
  default     = "PUBLIC"

  validation {
    condition     = contains(["PUBLIC", "PRIVATE"], var.endpoint_type)
    error_message = "endpoint_type must be either 'PUBLIC' or 'PRIVATE'."
  }
}

variable "path_prefix" {
  description = "Deployment path prefix exposed by the API Gateway."
  type        = string
  default     = "/v1"

  validation {
    condition     = startswith(var.path_prefix, "/")
    error_message = "path_prefix must start with '/'."
  }
}

variable "gateway_display_name" {
  description = "Optional display name override for the API Gateway."
  type        = string
  default     = null
}

variable "deployment_display_name" {
  description = "Optional display name override for the API Gateway deployment."
  type        = string
  default     = null
}

variable "defined_tags" {
  description = "Defined tags applied to API Gateway resources."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags applied to API Gateway resources."
  type        = map(string)
  default     = {}
}

variable "routes" {
  description = "Route definitions for the API Gateway deployment."
  type = list(object({
    name    = string
    path    = string
    methods = list(string)
    backend = object({
      type        = string
      function_id = optional(string)
      url         = optional(string)
    })
  }))

  validation {
    condition     = length(var.routes) > 0
    error_message = "At least one route must be defined."
  }

  validation {
    condition     = length(distinct([for route in var.routes : route.name])) == length(var.routes)
    error_message = "Each route name must be unique."
  }

  validation {
    condition     = alltrue([for route in var.routes : startswith(route.path, "/")])
    error_message = "Each route path must start with '/'."
  }

  validation {
    condition = alltrue([
      for route in var.routes :
      contains(["ORACLE_FUNCTIONS_BACKEND", "HTTP_BACKEND"], route.backend.type)
    ])
    error_message = "Supported backend types are ORACLE_FUNCTIONS_BACKEND and HTTP_BACKEND."
  }

  validation {
    condition = alltrue([
      for route in var.routes :
      route.backend.type != "ORACLE_FUNCTIONS_BACKEND" || try(route.backend.function_id, null) != null
    ])
    error_message = "Routes using ORACLE_FUNCTIONS_BACKEND must define backend.function_id."
  }

  validation {
    condition = alltrue([
      for route in var.routes :
      route.backend.type != "HTTP_BACKEND" || try(route.backend.url, null) != null
    ])
    error_message = "Routes using HTTP_BACKEND must define backend.url."
  }
}

variable "custom_authentication" {
  description = "Optional custom authentication policy applied at the deployment level."
  type = object({
    function_id  = string
    token_header = string
  })
  default = null
}
