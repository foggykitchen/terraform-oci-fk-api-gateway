# Example 01: Public HTTP Backend

This example shows a **public OCI API Gateway** deployed into a reusable VCN subnet and forwarding traffic to a simple **HTTP backend**.

It is intentionally small:

- `terraform-oci-fk-vcn` creates the network foundation
- `terraform-oci-fk-api-gateway` creates the gateway and deployment
- the backend is a plain HTTP target

This is the cleanest starting point for learning API Gateway before composing it with OCI Functions or other backend services.

---

## What This Example Shows

- Public API Gateway endpoint
- Explicit subnet injection from `terraform-oci-fk-vcn`
- HTTP backend routing with a single route
- Reusable building block composition rather than self-contained hidden networking

---

## Deploy Using Terraform CLI

```bash
cd examples/01_public_http_backend
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

---

## Related Resources

- [Root module](../../README.md)
- [Examples index](../README.md)
- [FoggyKitchen OCI VCN Module](https://github.com/foggykitchen/terraform-oci-fk-vcn)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
