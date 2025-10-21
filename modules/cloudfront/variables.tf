variable "origin_id" {
  type        = string
  description = "Id do S3"
}

variable "bucket_domain_name" {
  type        = string
  description = "Domínio do S3"
}

variable "cdn_price_class" {
  type        = string
  description = "Classe de preço do CDN"
  default     = "PriceClass_200"
}

variable "cdn_flags" {
  type        = map(string)
  description = "Flags do CDN"
  default     = {
    IaC = true
  }
}