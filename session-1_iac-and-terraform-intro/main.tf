terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "aws" {
  region = var.region
}

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

resource "aws_vpc" "iac-lab-tfm-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "iac-lab-tfm:dnitros"
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.iac-lab-tfm-vpc.id
}
