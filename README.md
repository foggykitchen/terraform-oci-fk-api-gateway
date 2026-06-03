# terraform-oci-fk-api-gateway

This repository contains a reusable **Terraform/OpenTofu module** and focused examples for deploying **Oracle Cloud Infrastructure (OCI) API Gateway** resources with deployment routes and backend integrations.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is designed to work cleanly with reusable infrastructure modules such as **`terraform-oci-fk-vcn`**, **`terraform-oci-fk-function`**, and future traffic or integration components.

Support expectations are documented in [SUPPORT.md](SUPPORT.md).

---

## Used By

This module is used as a building block by the higher-level [FoggyKitchen Landing Zone Orchestrator](https://github.com/foggykitchen/foggykitchen-landing-zone-orchestrator), where it is composed into Azure, OCI, and multicloud landing zone patterns.

## Purpose

The goal of this module is to provide a **clean, composable, and educational reference implementation** for OCI API Gateway:

- Focused on OCI-native API Gateway primitives
- Suitable for function backends and HTTP backends
- Designed for hands-on learning, module composition, and service integration scenarios

This is **not** a full serverless platform or integration framework. It is a **learning-first, architecture-aware module**.

---

## What the module does

The module creates:

- OCI API Gateway
- OCI API Gateway deployment
- One or more deployment routes
- Backend integrations for OCI Functions or generic HTTP endpoints

The module intentionally does **not** create:
- VCNs or subnets
- OCI Functions applications or functions
- IAM policies granting API Gateway access to backend services
- Load Balancers
- Notifications, Streams, or Service Connector Hub

Each of those concerns belongs in its own dedicated module.

---

## Repository Structure

```bash
terraform-oci-fk-api-gateway/
├── examples/
│   ├── 01_public_http_backend/
│   ├── 02_functions_backend/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

All examples are intentionally small and show **incremental API Gateway patterns**, starting from a single HTTP backend and then moving into OCI Functions integration.

---

## Example Usage

### Public HTTP backend

```hcl
module "api_gateway" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-api-gateway.git?ref=v0.1.0"

  name             = "fk-http-gateway"
  compartment_ocid = var.compartment_ocid
  subnet_id        = var.subnet_id

  routes = [
    {
      name    = "health"
      path    = "/health"
      methods = ["GET"]
      backend = {
        type = "HTTP_BACKEND"
        url  = "https://httpbin.org/status/200"
      }
    }
  ]
}
```

### OCI Functions backend

```hcl
module "api_gateway" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-api-gateway.git?ref=v0.1.0"

  name             = "fk-functions-gateway"
  compartment_ocid = var.compartment_ocid
  subnet_id        = var.subnet_id
  path_prefix      = "/v1"

  routes = [
    {
      name    = "fncustom1"
      path    = "/fncustom1"
      methods = ["POST"]
      backend = {
        type        = "ORACLE_FUNCTIONS_BACKEND"
        function_id = var.function1_id
      }
    },
    {
      name    = "fncustom2"
      path    = "/fncustom2"
      methods = ["POST"]
      backend = {
        type        = "ORACLE_FUNCTIONS_BACKEND"
        function_id = var.function2_id
      }
    }
  ]
}
```

---

## Module Inputs

### Core inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `name` | `string` | ✅ | Base display name used for API Gateway resources |
| `compartment_ocid` | `string` | ✅ | OCI compartment OCID |
| `subnet_id` | `string` | ✅ | Subnet OCID used by the API Gateway |
| `endpoint_type` | `string` | ❌ | `PUBLIC` or `PRIVATE` |
| `path_prefix` | `string` | ❌ | Deployment path prefix, `/v1` by default |
| `gateway_display_name` | `string` | ❌ | Optional display name override for the gateway |
| `deployment_display_name` | `string` | ❌ | Optional display name override for the deployment |
| `defined_tags` | `map(string)` | ❌ | Defined tags |
| `freeform_tags` | `map(string)` | ❌ | Freeform tags |

### Route inputs

```hcl
routes = list(object({
  name    = string
  path    = string
  methods = list(string)
  backend = object({
    type        = string
    function_id = optional(string)
    url         = optional(string)
  })
}))
```

Supported backend types:

- `ORACLE_FUNCTIONS_BACKEND`
- `HTTP_BACKEND`

For `ORACLE_FUNCTIONS_BACKEND`, set `backend.function_id`.

For `HTTP_BACKEND`, set `backend.url`.

---

## Outputs

| Output | Description |
|------|-------------|
| `gateway_id` | API Gateway OCID |
| `gateway_state` | API Gateway lifecycle state |
| `deployment_id` | API Gateway deployment OCID |
| `deployment_endpoint` | Base deployment endpoint |
| `path_prefix` | Deployment path prefix |
| `route_endpoints` | Map of route name to resolved HTTPS endpoint |
| `routes` | Route definitions echoed back with resolved endpoints |

---

## Examples Overview

| Example | Description |
|-------|-------------|
| `01_public_http_backend` | Public API Gateway integrated with a simple HTTP backend and reusable `terraform-oci-fk-vcn` networking |
| `02_functions_backend` | API Gateway routing pattern for existing OCI Functions backends, designed to pair with `terraform-oci-fk-function` |

See [`examples/`](examples) for details.

---

## Design Philosophy

- Explicit over implicit
- Small modules over monoliths
- API Gateway concerns separated from networking and backend services
- Optimized for **learning, reuse, and composition**

This makes the module ideal for:

- OCI Functions front doors
- HTTP endpoint publishing
- API integration workshops
- Multimodule training scenarios

---

## Related Resources

- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/foggykitchen/terraform-oci-fk-vcn)
- [FoggyKitchen OCI Function Module (terraform-oci-fk-function)](https://github.com/foggykitchen/terraform-oci-fk-function)
- [FoggyKitchen OCI Load Balancer Module (terraform-oci-fk-loadbalancer)](https://github.com/foggykitchen/terraform-oci-fk-loadbalancer)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
