resource "aws_vpc" "private_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_tag_name
  }
}

### AWS SUBNETS ###

resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnet_cidrs

  vpc_id                  = aws_vpc.private_vpc.id
  cidr_block              = each.value
  availability_zone       = element(var.availability_zones, index(keys(var.public_subnet_cidrs), each.key))
  map_public_ip_on_launch = true
  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnet_cidrs

  vpc_id            = aws_vpc.private_vpc.id
  cidr_block        = each.value
  availability_zone = element(var.availability_zones, index(keys(var.private_subnet_cidrs), each.key))
  tags = {
    Name = each.key
  }
}

### AWS GATEWAYS ###

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.private_vpc.id
  tags = {
    Name = var.internet_gateway_tag
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets["public_subnet_1"].id
  tags = {
    Name = var.nat_gateway_tag
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

### AWS ROUTE TABLES ###

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.private_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_route_table_tag
  }
}

resource "aws_route_table_association" "public_subnet_associations" {
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.private_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = var.private_route_table_tag
  }
}

resource "aws_route_table_association" "private_subnet_associations" {
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}
