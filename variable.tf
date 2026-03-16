variable "vpc_cidr" {
  type = string
}
variable "subnet_cidr_1" {
  type = string
}
variable "subnet_AZ_1" {
  type = string
}
variable "subnet_cidr_2" {
  type = string
}
variable "subnet_AZ_2" {
  type = string
}
variable "rt_cidr" {
  type = string
}
variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "user_data" {
  type = string
}
variable "alb_type" {
  type = string
}



# tags
variable "vpc_tag" {
  type = string
}
variable "subnet_tag_1" {
  type = string
}
variable "subnet_tag_2" {
  type = string
}
variable "igw_tag" {
  type = string
}
variable "rt_tag" {
  type = string
}
variable "sg_tag_alb" {
  type = string
}
variable "sg_tag_instance" {
  type = string
}
variable "instance_tag" {
  type = string
}
variable "tg_name" {
  type = string
}
variable "alb_name" {
  type = string
}