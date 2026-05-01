// VPC //
module "dr_vpc" {
  source = "./modules/vpc"
  providers = {
    aws = aws.secondary
  }

  vpc_cidr = "10.1.0.0/16"
  subnet_cidr = "10.1.1.0/24"
  az_name = "eu-west-2a"

}

// COMPUTE //
module "dr_instance" {
  source = "./modules/ec2"
  providers = {
    aws = aws.secondary
  }

  instance_ami = "ami-0685f8dd865c8e389"
  instance_type = "t3.micro"

  public_subnet_id = module.dr_vpc.public_subnet_id
  security_group_id = module.dr_security_group.security_group_id
}

// DR INSTANCE DEFAULT STATE //
resource "aws_ec2_instance_state" "dr_instance_state" {
  instance_id = module.dr_instance.instance_id
  state = "stopped"
  provider = aws.secondary
}

// SECURITY GROUP //
module "dr_security_group" {
  source = "./modules/security_group"
  providers = {
    aws = aws.secondary
  }
  vpc_id = module.dr_vpc.vpc_id
}
