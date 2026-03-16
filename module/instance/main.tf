resource "aws_instance" "alb_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  for_each = {
    subnet1_id = var.subnet_1_id
    subnet2_id = var.subnet_2_id
  } # This automaically creates two instances using the subnet
  subnet_id = each.value # This now loops through the subnet and creates the instances
  vpc_security_group_ids = [ var.sg_instance_id ]
  user_data = var.user_data

  tags = {
    Name = var.instance_tag
  }
}