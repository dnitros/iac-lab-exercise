resource "aws_vpc" "iac-lab-tfm-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "iac-lab-tfm:dnitros"
  }
}