output "public_ip" {
  description = "Public IP Address"
  value = aws_instance.webserver.*.public_ip
}