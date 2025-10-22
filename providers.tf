terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
  backend "s3" {
    bucket  = "a2g-grupo-state-bucket-arturgrr-iac"
    region  = "sa-east-1"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "AdministratorAccess-058264405800"
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "AdministratorAccess-058264405800"
}

resource "aws_s3_bucket" "a2g_state_bucket" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "a2g_state_bucket_versioning" {
  bucket = aws_s3_bucket.a2g_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.a2g_state_bucket]
}
