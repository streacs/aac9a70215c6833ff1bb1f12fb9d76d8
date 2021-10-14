module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
}

resource "aws_instance" "webserver" {
  count = var.instance_count

  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type

  subnet_id = module.vpc.public_subnets[0]

  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = templatefile("user_data.sh", {username = "Picard"})

  tags = merge(local.tags, tomap({ Name = "Oliver's Webserver" }))
}

resource "aws_security_group" "web" {
  name_prefix = "web-access"
  description = "Allow access to the server from the web"

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(local.tags, tomap({ Name = "Oliver's Webserver" }))
}