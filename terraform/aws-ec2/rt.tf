resource "aws_route_table" "simplewebapp_pub_rt" {
    vpc_id = aws_vpc.simplewebapp-project.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "route1" {
    subnet_id = aws_subnet.simplewebapp-subnet.id
    route_table_id = aws_route_table.simplewebapp_pub_rt.id
}