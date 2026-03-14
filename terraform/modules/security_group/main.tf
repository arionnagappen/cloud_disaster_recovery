resource "aws_security_group" "allow_http" {
  name = "allow_http"
  description = "Allow HTTP inbound traffic and all outbound traffic"
  vpc_id = var.prim_vpc_id

  tags = {
    Name = "allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_http.id
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  to_port = 80
}

// SSH //
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


