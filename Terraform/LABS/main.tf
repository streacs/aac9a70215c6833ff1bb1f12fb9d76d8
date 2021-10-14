resource "aws_instance" "webserver" {
  count = var.instance_count

  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = templatefile("user_data.sh", {username = "Picard"})

  tags = merge(local.tags, tomap({ Name = "Oliver's Webserver" }))
}

resource "aws_security_group" "web" {
  name_prefix = "web-access"
  description = "Allow access to the server from the web"
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