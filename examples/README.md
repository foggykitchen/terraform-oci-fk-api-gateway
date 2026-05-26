# OCI API Gateway with Terraform/OpenTofu - Examples

This directory contains focused examples for the **terraform-oci-fk-api-gateway** module.
The examples show practical OCI API Gateway integration patterns, starting from a simple public HTTP backend and moving to OCI Functions routing.

These examples are part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and are intended to be composed with reusable OCI networking and service modules.

---

## Published Examples

| Example | Title | Key Topics |
|:-------:|:------|:-----------|
| 01 | **Public HTTP Backend** | public API Gateway, reusable `terraform-oci-fk-vcn`, HTTP backend routing |
| 02 | **Functions Backend Integration** | API Gateway route mapping for existing OCI Functions, `terraform-oci-fk-function` composition pattern |

---

## How to Use

Each example directory contains:

- Terraform/OpenTofu configuration (`.tf`)
- A focused `README.md` explaining the architecture goal
- Minimal variables required to compose the module

To run the public HTTP backend example:

```bash
cd examples/01_public_http_backend
tofu init
tofu plan
tofu apply
```

To run the functions backend integration example:

```bash
cd examples/02_functions_backend
tofu init
tofu plan
tofu apply
```

---

## Design Principles

- One example = one architectural goal
- Clear separation between networking, API publishing, and backend services
- No hidden VCN provisioning inside the API Gateway module
- Examples designed to integrate with other modules such as VCN and Functions

---

## Related Resources

- [FoggyKitchen OCI API Gateway Module (terraform-oci-fk-api-gateway)](../)
- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/foggykitchen/terraform-oci-fk-vcn)
- [FoggyKitchen OCI Function Module (terraform-oci-fk-function)](https://github.com/foggykitchen/terraform-oci-fk-function)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
