# terraform-modules-cloudflare

A collection of reusable OpenTofu/Terraform modules for managing Cloudflare resources.

## Modules

| Module | Description |
|--------|-------------|
| [cloudflare-dns](./modules/cloudflare-dns) | Manages a set of DNS records in a single Cloudflare zone |

## Usage

### OCI Registry (OpenTofu >= 1.8)

```hcl
module "dns" {
  source  = "oci://ghcr.io/mirceanton/terraform-modules-cloudflare/cloudflare-dns"
  version = "v0.1.0"
}
```

### Git Source

```hcl
module "dns" {
  source = "git::https://github.com/mirceanton/terraform-modules-cloudflare.git//modules/cloudflare-dns?ref=v0.1.0"
}
```
