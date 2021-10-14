variable "instance_type" {
  type = string
  description = "Instance type for the web server."
  default = "t2.nano"
}

variable "instance_count" {
  type = number
  description = "Instance count for the web server."
  default = 3
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "subnet_id" {
  type = string
  description = "List of subnet IDs"
}