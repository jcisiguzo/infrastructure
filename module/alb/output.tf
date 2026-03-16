output "alb_id" {
  value = aws_lb.alb_lb.id
}
output "alb_dns" {
  value = aws_lb.alb_lb.dns_name
}