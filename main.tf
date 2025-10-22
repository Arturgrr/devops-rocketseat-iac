module "s3" {
  source         = "./modules/s3-bucket"
  s3_bucket_name = "a2g-grupo-s3-bucket-arturgrr-iac-${terraform.workspace}"
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = "a2g-grupo-s3-bucket-arturgrr-iac-${terraform.workspace}"
  bucket_domain_name = module.s3.bucket_domain_name
  cdn_price_class    = "PriceClass_200"

  depends_on = [
    module.s3
  ]
}

module "sqs" {
  source     = "terraform-aws-modules/sqs/aws"
  name       = "a2g-grupo-sqs"
  create_dlq = true

  tags = {
    IaC = true
  }
}