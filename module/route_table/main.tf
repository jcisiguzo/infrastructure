# Route table (for two subnet)
resource "aws_route_table" "alb_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.rt_cidr
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.rt_tag
  }
}

# rt association
resource "aws_route_table_association" "alb_rta" {
  subnet_id      = var.subnet_1_id
  route_table_id = aws_route_table.alb_rt.id
}
resource "aws_route_table_association" "alb_rta2" {
  subnet_id      = var.subnet_2_id
  route_table_id = aws_route_table.alb_rt.id
}