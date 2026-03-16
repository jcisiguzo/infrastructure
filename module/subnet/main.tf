# Subnet 1
resource "aws_subnet" "alb_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_1
  availability_zone = var.subnet_AZ_1
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_tag_1
  }
}

# Subnet 2
resource "aws_subnet" "alb_subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_2
  availability_zone = var.subnet_AZ_2
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_tag_2
  }
}