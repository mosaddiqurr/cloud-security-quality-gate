resource "aws_s3_bucket_public_access_block" "example" {
  bucket = "synthetic-training-bucket"

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}
