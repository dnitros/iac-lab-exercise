variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "192.168.0.0/25"
}