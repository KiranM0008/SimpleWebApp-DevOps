resource "ibm_is_subnet" "simplewebappsubnet" {
  name            = "simplewebappsubnet"
  vpc             = ibm_is_vpc.simplewebappproject.id
  zone            = "us-south-1"
  ipv4_cidr_block = "10.0.0.0/24"
}