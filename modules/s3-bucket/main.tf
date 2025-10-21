resource "aws_s3_bucket" "a2g_s3_bucket" {
  bucket = var.s3_bucket_name

  tags = var.s3_bucket_flags
}

resource "aws_s3_bucket_website_configuration" "bucket" {
  bucket = aws_s3_bucket.a2g_s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

  depends_on = [aws_s3_bucket.a2g_s3_bucket]
}