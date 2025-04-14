resource "aws_vpc" "simplewebapp-project" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "simplewebapp-project"
  }
}
