provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "simplewebapp" {
    ami = var.ami
    instance_type = var.ec2_instance_type
    subnet_id = aws_subnet.simplewebapp-subnet.id
    key_name = aws_key_pair.simplewebapp-key.key_name
    vpc_security_group_ids = [aws_security_group.simplewebapp_sg.id]
    iam_instance_profile = aws_iam_instance_profile.cw_instance_profile.name
}