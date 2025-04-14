resource "aws_subnet" "simplewebapp-subnet" {
    vpc_id = aws_vpc.simplewebapp-project.id
    cidr_block = var.subnet_cidr
    availability_zone = var.subnet_availability_zone
    map_public_ip_on_launch = true
}