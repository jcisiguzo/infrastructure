resource "aws_vpc" "alb_vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = var.vpc_tag
  }
}