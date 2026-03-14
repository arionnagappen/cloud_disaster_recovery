output "prim_vpc_id" {
  value = aws_vpc.prim_vpc.id
}

output "prim_public_subnet_id" {
  value = aws_subnet.prim_public_subnet.id
}