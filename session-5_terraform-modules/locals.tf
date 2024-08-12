locals {
  subnets = flatten([
    [
      for i in range(var.number_of_public_subnets) : {
        type              = "public",
        cidr_block        = cidrsubnet(var.vpc_cidr, 3, i + 1),
        availability_zone = data.aws_availability_zones.available.names[i % length(data.aws_availability_zones.available.names)],
        name              = format("%s-public-subnet-%d", var.prefix, i + 1)
      }
    ],
    [
      for i in range(var.number_of_private_subnets) : {
        type              = "private",
        cidr_block        = cidrsubnet(var.vpc_cidr, 3, i + 3),
        availability_zone = data.aws_availability_zones.available.names[i % length(data.aws_availability_zones.available.names)],
        name              = format("%s-private-subnet-%d", var.prefix, i + 1)
      }
    ],
    [
      for i in range(var.number_of_secure_subnets) : {
        type              = "secure",
        cidr_block        = cidrsubnet(var.vpc_cidr, 3, i + 5),
        availability_zone = data.aws_availability_zones.available.names[i % length(data.aws_availability_zones.available.names)],
        name              = format("%s-secure-subnet-%d", var.prefix, i + 1)
      }
    ]
  ])
}
