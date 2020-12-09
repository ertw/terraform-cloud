
resource "aws_s3_bucket" "b" {
  bucket = "ertw-terraform-serverless-example"
  acl    = "public-read"

  tags = {
    Name        = "serverless example bucket"
    Environment = "Dev"
  }
}
