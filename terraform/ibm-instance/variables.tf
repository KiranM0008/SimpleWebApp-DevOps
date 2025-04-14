variable ibmcloud_api_key {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources"
  type        = string
  default = "invalidKeyForRef"
}

variable ibm_region {
  description = "IBM Cloud region where all resources will be deployed"
  type        = string
  default     = "us-south"
}
