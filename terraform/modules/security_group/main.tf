// SECURITY GROUP //
resource "aws_security_group" "allow_http" {
  name = "VPC Security Group"
  description = "VPC Security Group"
  vpc_id = var.vpc_id
}

// ALLOW HTTP //
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_http.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
}

// ALLOW SSH //
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_http.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
}

// ALLOW ALL OUTBOUND //
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.allow_http.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}


