variable "prefix" {
  type        = string
  description = "Prefix to be used for all resources"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private Subnet IDs"
}

variable "alb_target_group_arn" {
  type        = string
  description = "ALB Target Group ARN"
}

variable "alb_security_group_id" {
  type        = string
  description = "ALB Security Group ID"
}

variable "db_address" {
  type        = string
  description = "Database Address"
}

variable "db_name" {
  type        = string
  description = "Database Name"
}

variable "db_username" {
  type        = string
  description = "Database Username"
}

variable "db_secret_arn" {
  type        = string
  description = "Database Secret ARN"
}

variable "db_secret_key_id" {
  type        = string
  description = "Database Secret Key ID"
}
