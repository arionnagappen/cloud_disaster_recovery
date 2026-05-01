// EC2 INSTANCE //
resource "aws_instance" "ec2_instance" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id

  vpc_security_group_ids = [var.security_group_id]

  monitoring = true

  user_data_base64 = base64encode(file("${path.module}/run_nginx.sh"))

  tags = {
    Name = "Instance"
  }
}
