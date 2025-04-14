resource "aws_security_group" "simplewebapp_sg" {
    name = "simplewebapp_sg"
    vpc_id = aws_vpc.simplewebapp-project.id

    ingress {
        description = "HTTP port"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH port"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "App port"
        from_port = 8787
        to_port = 8787
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "simplewebapp_sg"
    }
}