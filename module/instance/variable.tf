variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "user_data" {
  type = string
}
variable "subnet_1_id" {}
variable "subnet_2_id" {}
variable "sg_instance_id" {}

# tag
variable "instance_tag" {
  type = string
}