# cloudflare-dns

Manages a set of DNS records in a single Cloudflare zone.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 5.18.0 |

## Resources

| Name | Type |
|------|------|
| [cloudflare_dns_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | Default comment to set on every DNS record. Can be overridden per record. | `string` | `null` | no |
| <a name="input_records"></a> [records](#input\_records) | Map of DNS records to create in the zone. Key is the record name (subdomain). | <pre>map(object({<br/>    type     = string<br/>    content  = string<br/>    ttl      = optional(number, 1)<br/>    proxied  = optional(bool, false)<br/>    comment  = optional(string)<br/>    priority = optional(number)<br/>    tags     = optional(set(string))<br/><br/>    # Settings for the DNS record (proxied records only for ipv4_only/ipv6_only)<br/>    settings = optional(object({<br/>      flatten_cname = optional(bool)<br/>      ipv4_only     = optional(bool)<br/>      ipv6_only     = optional(bool)<br/>    }))<br/>  }))</pre> | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The Cloudflare zone domain name (e.g. 'mirceanton.com'). The zone ID is looked up automatically. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_record_ids"></a> [record\_ids](#output\_record\_ids) | Map of DNS record name to Cloudflare record ID |
<!-- END_TF_DOCS -->
