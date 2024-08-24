locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
  subnets = {
    public_cidr_blocks  = [for i in range(var.number_of_subnets) : cidrsubnet(var.vpc_cidr, 3, i + 1)],
    private_cidr_blocks = [for i in range(var.number_of_subnets) : cidrsubnet(var.vpc_cidr, 3, i + 1 + var.number_of_subnets)],
    secure_cidr_blocks  = [for i in range(var.number_of_subnets) : cidrsubnet(var.vpc_cidr, 3, i + 1 + 2 * var.number_of_subnets)]
  }
  vpc_id = module.vpc.vpc_id
}
