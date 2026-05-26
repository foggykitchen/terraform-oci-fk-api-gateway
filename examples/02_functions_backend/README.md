# Example 02: Functions Backend Integration

This example shows how to expose **existing OCI Functions** through **OCI API Gateway** using the reusable module.

The example assumes that the functions already exist, for example because they were created by:

- `terraform-oci-fk-function`
- a training lesson
- another Terraform/OpenTofu stack

---

## What This Example Shows

- Public API Gateway endpoint
- Explicit subnet injection from `terraform-oci-fk-vcn`
- Multiple routes mapped to OCI Functions backends
- Clean separation between API publishing and function lifecycle management

---

## Deploy Using Terraform CLI

```bash
cd examples/02_functions_backend
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

---

## Notes

- This example does **not** create the functions themselves.
- It expects existing function OCIDs.
- The IAM policy allowing API Gateway to invoke OCI Functions should be managed separately in the calling stack.

---

## Related Resources

- [Root module](../../README.md)
- [Examples index](../README.md)
- [FoggyKitchen OCI Function Module](https://github.com/foggykitchen/terraform-oci-fk-function)
- [FoggyKitchen OCI VCN Module](https://github.com/foggykitchen/terraform-oci-fk-vcn)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
