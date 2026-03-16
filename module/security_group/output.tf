output "sg_alb_id" {
  value = aws_security_group.alb_sg.id
}
output "sg_instance_id" {
  value = aws_security_group.alb_sg_instance.id
}