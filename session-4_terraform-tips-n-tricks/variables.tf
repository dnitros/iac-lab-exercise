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

variable "number_of_public_subnets" {
  type        = number
  description = "Number of public subnets to create"
}

variable "number_of_private_subnets" {
  type        = number
  description = "Number of private subnets to create"
}

variable "number_of_secure_subnets" {
  type        = number
  description = "Number of secure subnets to create"
}
