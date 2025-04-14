resource "aws_key_pair" "simplewebapp-key" {
    public_key = file("../../ansible/simplewebapp.pub")
    key_name = "simplewebapp-key"  
}