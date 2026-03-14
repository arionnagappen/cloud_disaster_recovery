// EC2 INSTANCE //
resource "aws_instance" "prim_instance" {
  ami = var.prim_instance_ami
  instance_type = var.prim_instance_type
  subnet_id = var.prim_public_subnet_id

  vpc_security_group_ids = [var.security_group_id]

  monitoring = true

  user_data_base64 = base64encode(file("${path.module}/run_nginx.sh"))

  tags = {
    Name = "Primary Instance"
  }
}