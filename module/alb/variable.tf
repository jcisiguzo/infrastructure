variable "alb_type" {
  type = string
}
variable "vpc_id" {}
variable "subnet_1_id" {}
variable "subnet_2_id" {}
variable "sg_alb_id" {}
variable "instance_ids" {
  type = map(string)
} #correction

# tags
variable "tg_name" {
  type = string
}
variable "alb_name" {
  type = string
}