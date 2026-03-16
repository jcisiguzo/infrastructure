# Automating AWS Infrastructure with Terraform

This project demonstrates how to deploy a **scalable AWS infrastructure using Terraform modules** following Infrastructure as Code (IaC) best practices.

The architecture provisions a complete environment including:

- VPC
- Subnets across multiple Availability Zones
- Internet Gateway
- Route Tables
- Security Groups
- EC2 Instances
- Application Load Balancer (ALB)

The infrastructure is designed using **modular Terraform architecture**, making the code reusable, organized, and easy to maintain.

---

# Architecture Overview

The project deploys the following AWS resources:
terraform-aws-infrastructure/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
├── module/
│ │
│ ├── vpc/
│ │ └── VPC creation
│ │
│ ├── subnet/
│ │ └── Public subnets
│ │
│ ├── igw/
│ │ └── Internet Gateway
│ │
│ ├── route_table/
│ │ └── Route table and associations
│ │
│ ├── security_group/
│ │ └── Security groups for ALB and EC2
│ │
│ ├── instance/
│ │ └── EC2 instance deployment
│ │
│ └── alb/
│ └── Application Load Balancer + Target Group


Terraform will create the infrastructure.

---

# Accessing the Application

After deployment Terraform will output the **Application Load Balancer DNS name**.