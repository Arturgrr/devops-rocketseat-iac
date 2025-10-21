variable "s3_bucket_name" {
    type = string
    description = "Nome do bucket"
}

variable "s3_bucket_flags" {
  type        = map(string)
  description = "Flags do bucket S3"
  default     = {
    IaC = true
  }
}