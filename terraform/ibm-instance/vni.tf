resource "ibm_is_virtual_network_interface" "simplewebappvni" {
  name                      = "simplewebappvni"
  allow_ip_spoofing         = false
  enable_infrastructure_nat = true
  primary_ip {
    auto_delete = false
    address     = "10.0.0.8"
  }
  subnet = ibm_is_subnet.simplewebappsubnet.id
}
