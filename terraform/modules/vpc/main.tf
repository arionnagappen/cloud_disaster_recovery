// VPC //
resource "aws_vpc" "prim_vpc" {
  cidr_block = var.prim_vpc_cidr
  tags = {
    Name = "Primary VPC"
  }
}

// PUBLIC SUBNET //
resource "aws_subnet" "prim_public_subnet" {
  vpc_id = aws_vpc.prim_vpc.id
  cidr_block = var.prim_subnet_cidr
  availability_zone = var.prim_az_name
  map_public_ip_on_launch = true

  tags = {
    Name = "Primary Public Subnet"
  }
}

// INTERNET GATEWAY //
resource "aws_internet_gateway" "prim_igw" {
  vpc_id = aws_vpc.prim_vpc.id

  tags = {
    Name = "Primary IGW"
  }
}

// ROUTE TABLES //
resource "aws_route_table" "route_internet_traffic" {
  vpc_id = aws_vpc.prim_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prim_igw.id
  }

  tags = {
    Name = "Route Internet Traffic"
  }
  
}

resource "aws_route_table_association" "prim_public_subnet_assoc" {
  subnet_id = aws_subnet.prim_public_subnet.id
  route_table_id = aws_route_table.route_internet_traffic.id
}