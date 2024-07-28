variable "prefix" {
  type        = string
  description = "Prefix to be used for all resources"
  default     = "dnitros-iac-lab"
}

variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
  default     = "ap-south-1"
}
