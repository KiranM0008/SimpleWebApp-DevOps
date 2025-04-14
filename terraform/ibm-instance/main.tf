terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.77.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.ibm_region
  ibmcloud_timeout = 60
}

data "ibm_is_image" "ubuntu" {
  name = "ibm-ubuntu-22-04-5-minimal-amd64-2"
}

resource "ibm_is_instance" "simplewebapp" {
  name    = "simplewebapp-instance"
  image   = data.ibm_is_image.ubuntu.id
  profile = "bx2-2x8"

  primary_network_attachment {
    name = "simplewebapp-primary-att"
    virtual_network_interface {
      id = "mock-vni-id"
    }
  }

  network_attachments {
    name = "simplewebapp-network-att"
    virtual_network_interface {
      name                      = "simplewebappvni"
      auto_delete               = true
      enable_infrastructure_nat = true
      primary_ip {
        auto_delete = true
        address     = "10.0.0.6"
      }
      subnet = "mock-subnet-id"
    }
  }

  vpc  = "mock-vpc-id"
  zone = "us-south-1"
  keys = ["mock-key-id"]

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
