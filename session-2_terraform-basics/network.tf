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

resource "aws_route_table" "main-route-table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-main-route-table", var.prefix)
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

resource "aws_main_route_table_association" "main-rt-assoc" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.main-route-table.id
}

resource "aws_route_table_association" "public-subnet-1-rt-assoc" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-2-rt-assoc" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-subnet-1-rt-assoc" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-2-rt-assoc" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-route-table.id
}
