output "instance_ids" {
  value = {
    for key, instance in aws_instance.alb_instance : key => instance.id
  }
}