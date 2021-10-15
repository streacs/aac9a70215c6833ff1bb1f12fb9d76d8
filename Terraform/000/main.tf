/*
Condition example
*/
variable "enable" {
  type    = bool
  default = true
}

resource "aws_s3_bucket" "app" {
  count = var.enable == true ? 1 : 0

  bucket = "terraform-oliver-wolf"
  acl    = "public-read"
  website { index_document = "index.html" }
}

resource "aws_s3_bucket_object" "app-index" {
  count = var.enable == true ? 1 : 0

  bucket       = aws_s3_bucket.app.0.id
  key          = "index.html"
  content      = "<h1>Terraform simplest sample!</h1>"
  content_type = "text/html"
  acl          = "public-read"
}

/*
Dynamic terraform Workspace example
*/
locals {
  counts = {
    default = 1
    production = 5
  }
  count = lookup(local.counts, terraform.workspace, "")
}

resource "aws_s3_bucket" "this" {
  count = local.count

  bucket = "terraform-ws-oliver-wolf-${[count.index]}"
  acl    = "public-read"
  website { index_document = "index.html" }
}

/*
Combined Example
*/
resource "aws_s3_bucket" "this2" {
  count = var.enable == true ? local.count : 0

  bucket = "terraform-ws-oliver-wolf-${[count.index]}"
  acl    = "public-read"
  website { index_document = "index.html" }
}
