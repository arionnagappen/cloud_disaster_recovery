// VPC //
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC"
  }
}

// PUBLIC SUBNET //
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.az_name
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

// INTERNET GATEWAY //
resource "aws_internet_gateway" "prim_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
}

// ROUTE TABLES //
resource "aws_route_table" "route_internet_traffic" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prim_igw.id
  }

  tags = {
    Name = "Route Internet Traffic"
  }
  
}

resource "aws_route_table_association" "prim_public_subnet_assoc" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_internet_traffic.id
}