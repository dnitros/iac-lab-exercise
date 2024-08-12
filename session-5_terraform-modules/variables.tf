variable "prefix" {
  type        = string
  description = "Prefix to be used for all resources"
}

variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "number_of_subnets" {
  type        = number
  description = "Number of subnets to create"
}
