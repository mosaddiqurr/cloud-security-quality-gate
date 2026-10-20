resource "aws_cloudtrail" "example" {
  name           = "synthetic-security-trail"
  s3_bucket_name = "synthetic-cloudtrail-logs"
  enable_logging = false
}
