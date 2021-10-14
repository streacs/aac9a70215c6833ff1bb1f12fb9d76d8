variable "my_default_tags" {
  type = map(string)
  description = "Definition for default tags for resources"
  default = {
    automated_through = "Terraform"
  }
}

variable "instance_type" {
  type = string
  description = "Instance type for the web server."
  default = "t2.nano"
}

variable "instance_count" {
  //type = number
  description = "Instance count for the web server."
  default = 3
}
