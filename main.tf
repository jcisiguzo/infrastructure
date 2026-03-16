# module VPC
module "vpc" {
  source = "./module/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_tag = var.vpc_tag
}
# module Subnet
module "subnets" {
  source = "./module/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_cidr_1 = var.subnet_cidr_1
  subnet_cidr_2 = var.subnet_cidr_2
  subnet_AZ_1 = var.subnet_AZ_1
  subnet_AZ_2 = var.subnet_AZ_2
  subnet_tag_1 = var.subnet_tag_1
  subnet_tag_2 = var.subnet_tag_2
}

# module IGW
module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id
  igw_tag = var.igw_tag
}

# module Route table (for two subnet)
module "rt" {
  source = "./module/route_table"
  vpc_id = module.vpc.vpc_id
  subnet_1_id = module.subnets.subnet_1_id
  subnet_2_id = module.subnets.subnet_2_id
  igw_id = module.igw.igw_id
  rt_cidr = var.rt_cidr
  rt_tag = var.rt_tag
}


# module Security group for the ALB and Instance
module "sg_alb_and_instance" {
  source = "./module/security_group"
  vpc_id = module.vpc.vpc_id
  sg_tag_alb = var.sg_tag_alb
  sg_tag_instance = var.sg_tag_instance
}

# module Instance
module "instances" {
  source = "./module/instance"
  ami = var.ami
  instance_type = var.instance_type
  subnet_1_id = module.subnets.subnet_1_id
  subnet_2_id = module.subnets.subnet_2_id
  sg_instance_id = module.sg_alb_and_instance.sg_instance_id
  user_data = var.user_data
  instance_tag = var.instance_tag
}

# Module Application Load Balancer
module "alb" {
  source = "./module/alb"
  alb_name = var.alb_name
  alb_type = var.alb_type
  vpc_id = module.vpc.vpc_id
  subnet_1_id = module.subnets.subnet_1_id
  subnet_2_id = module.subnets.subnet_2_id
  sg_alb_id = module.sg_alb_and_instance.sg_alb_id
  instance_ids = module.instances.instance_ids
  tg_name = var.tg_name
}