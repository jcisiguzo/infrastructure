resource "aws_internet_gateway" "alb_gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_tag
  }
}