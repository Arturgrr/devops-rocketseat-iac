output "s3_bucket_name" {
  value       = module.s3.bucket_domain_name
  sensitive   = false
  description = "Nome do bucket S3"
}

output "cdn_domain" {
  value       = module.cloudfront.cloudfront_domain_name
  sensitive   = false
  description = "Domínio do CDN"
}