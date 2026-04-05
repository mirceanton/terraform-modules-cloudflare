output "record_ids" {
  description = "Map of DNS record name to Cloudflare record ID"
  value       = { for k, v in cloudflare_dns_record.this : k => v.id }
}
