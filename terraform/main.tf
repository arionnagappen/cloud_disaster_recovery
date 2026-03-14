// VPC //
module "prim_vpc" {
  source = "./modules/vpc"

  prim_vpc_cidr = "10.0.0.0/16"
  prim_subnet_cidr = "10.0.1.0/24"
  prim_az_name = "eu-west-1a"
}

// COMPUTE //
module "prim_instance" {
  source = "./modules/ec2"

  prim_instance_ami = "ami-0d1b55a6d77a0c326"
  prim_instance_type = "t3.micro"

  prim_public_subnet_id = module.prim_vpc.prim_public_subnet_id
  security_group_id = module.security_group.security_group_id

}

// SECURITY GROUP //
module "security_group" {
  source = "./modules/security_group"
  prim_vpc_id = module.prim_vpc.prim_vpc_id
}