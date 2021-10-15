module "s3" {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git"

  bucket = "owolf-terraform-${terraform.workspace}"
}