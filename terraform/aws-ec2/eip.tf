resource "aws_eip" "simplewebapp_eip" {
    instance = aws_instance.simplewebapp.id
    domain = "vpc"  
}