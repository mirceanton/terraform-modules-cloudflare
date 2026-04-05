variable "zone_name" {
  description = "The Cloudflare zone domain name (e.g. 'mirceanton.com'). The zone ID is looked up automatically."
  type        = string
}

variable "comment" {
  description = "Default comment to set on every DNS record. Can be overridden per record."
  type        = string
  default     = null
}

variable "records" {
  description = "Map of DNS records to create in the zone. Key is the record name (subdomain)."
  type = map(object({
    type     = string
    content  = string
    ttl      = optional(number, 1)
    proxied  = optional(bool, false)
    comment  = optional(string)
    priority = optional(number)
    tags     = optional(set(string))

    # Settings for the DNS record (proxied records only for ipv4_only/ipv6_only)
    settings = optional(object({
      flatten_cname = optional(bool)
      ipv4_only     = optional(bool)
      ipv6_only     = optional(bool)
    }))
  }))

  validation {
    condition     = alltrue([for r in var.records : contains(["A", "AAAA", "CNAME", "MX", "TXT"], r.type)])
    error_message = "Only A, AAAA, CNAME, MX, and TXT record types are supported."
  }
}
