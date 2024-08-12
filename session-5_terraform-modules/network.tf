data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_subnet" "subnet" {
  for_each = { for subnet in local.subnets : subnet.name => subnet }

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.name
    Type = each.value.type
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-internet-gateway", var.prefix)
  }
}

resource "aws_eip" "eip-nat" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip-nat", var.prefix)
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.subnet[format("%s-private-subnet-1", var.prefix)].id

  tags = {
    Name = format("%s-nat-gateway", var.prefix)
  }
}

resource "aws_default_route_table" "default-route-table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name = format("%s-default-route-table", var.prefix)
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = format("%s-public-route-table", var.prefix)
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = format("%s-private-route-table", var.prefix)
  }
}

resource "aws_route_table_association" "route_table_association" {
  for_each  = aws_subnet.subnet
  subnet_id = each.value.id
  route_table_id = lookup({
    "public"  = aws_route_table.public-route-table.id,
    "private" = aws_route_table.private-route-table.id,
    "secure"  = aws_default_route_table.default-route-table.id
  }, each.value.tags["Type"], null)
}
