resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = format("%sa", var.region)
  tags = {
    Name = format("%s-public-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = format("%sb", var.region)
  tags = {
    Name = format("%s-public-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet3_cidr
  availability_zone = format("%sa", var.region)
  tags = {
    Name = format("%s-private-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet4_cidr
  availability_zone = format("%sb", var.region)
  tags = {
    Name = format("%s-private-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "secure-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet5_cidr
  availability_zone = format("%sa", var.region)
  tags = {
    Name = format("%s-secure-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "secure-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet6_cidr
  availability_zone = format("%sb", var.region)
  tags = {
    Name = format("%s-secure-subnet-2", var.prefix)
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
  subnet_id     = aws_subnet.private-subnet-1.id

  tags = {
    Name = format("%s-nat-gateway", var.prefix)
  }
}
