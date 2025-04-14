output "public_ip" {
  description = "Value for simplewebapp EIP"
  value = aws_eip.simplewebapp_eip.public_ip
}