terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git"
}

inputs = {
  bucket    = "owolf-terragrunt-testing"
}
