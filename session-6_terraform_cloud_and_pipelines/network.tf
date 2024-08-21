data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                       = "${var.prefix}-vpc"
  cidr                       = var.vpc_cidr
  enable_dns_hostnames       = true
  enable_dns_support         = true
  manage_default_network_acl = false

  azs             = local.azs
  public_subnets  = local.subnets["public_cidr_blocks"]
  private_subnets = local.subnets["private_cidr_blocks"]
  intra_subnets   = local.subnets["secure_cidr_blocks"]

  enable_nat_gateway = true
  single_nat_gateway = true
}
