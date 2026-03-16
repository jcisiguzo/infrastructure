vpc_cidr = "10.0.0.0/16"
subnet_cidr_1 = "10.0.1.0/24"
subnet_cidr_2 = "10.0.2.0/24"
subnet_AZ_1 = "us-east-1a"
subnet_AZ_2 = "us-east-1b"
rt_cidr = "0.0.0.0/0"
ami = "ami-02dfbd4ff395f2a1b"
instance_type = "t3.micro"
user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "<h1>Hello world $(hostname)</h1>" > /var/www/html/index.html
  EOF
alb_type = "application"


# tag
vpc_tag = "vpc_alb"
igw_tag = "igw-alb"
subnet_tag_1 = "sub_1"
subnet_tag_2 = "sub_2"
rt_tag = "rt_alb"
instance_tag = "instance_alb"
tg_name = "dom-tg"
alb_name = "dom-alb"
sg_tag_alb = "sg_alb"
sg_tag_instance = "sg_instance"