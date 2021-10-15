resource "aws_s3_bucket" "app" {
  bucket  = "terraform-oliver-wolf"
  acl     = "public-read"
  website { index_document = "index.html" }
}

resource "aws_s3_bucket_object" "app-index" {
  bucket       = aws_s3_bucket.app.id
  key          = "index.html"
  content      = "<h1>Terraform simplest sample!</h1>"
  content_type = "text/html"
  acl          = "public-read"
}

output "static-url" {
  value = aws_s3_bucket.app.website_endpoint
}
