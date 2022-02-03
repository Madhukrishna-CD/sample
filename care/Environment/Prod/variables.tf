# variable for region
variable "aws_region" {
  type = string
}

# variable for vpc
variable "vpc_cidr" {
  type = string 
}
variable "vpc_name"{
  type = string
}

# variable for public subnet 1
variable "public_subnet1_cidr" {
  type = string
}
variable "public_subnet1_name" {
  type = string
}

# variable for public subnet 2
variable "public_subnet2_cidr" {
  type = string
}
variable "public_subnet2_name" {
  type = string
}

# variable for private subnet 1
variable "private_subnet1_cidr"{
  type = string
}
variable "private_subnet1_name" {
  type = string
}

# variable for private subnet 2
variable "private_subnet2_cidr"{
  type = string
}
variable "private_subnet2_name" {
  type = string
}

# variable for private subnet 3
variable "private_subnet3_cidr"{
  type = string
}
variable "private_subnet3_name" {
  type = string
}

# variable for private subnet 4
variable "private_subnet4_cidr"{
  type = string
}
variable "private_subnet4_name" {
  type = string
}

# variable for private subnet 5
variable "private_subnet5_cidr"{
  type = string
}
variable "private_subnet5_name" {
  type = string
}

# variable for ec2 instance
variable "image_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "instance_name" {
  type = string
}

# variable for security group
variable "sg_name0" {
  type = string
}

# variable for autoscaling launch config
variable "imageid_launch_configuration" {
  type = string
}
variable "launch_instance_type" {
  type = string
}

# variabe for autoscaling placement group
variable "placement_group_name" {
  type = string
}

# variable for autoscaling group 
variable "autoscaling_group_name" {
  type = string
}

# variable for autoscaling policy
variable "policy_name" {
  type = string
}

# variable for autoscaling cloudwatch alaram
variable "cloudwatch_alaram" {
  type = string
}

# variable for Application load balancer
variable "alb_name" {
  type = string
}

# variable for security group alb
variable "security_group_name" {
  type = string
}

# variable for dbinstance rds
variable "db_username" {
  type = string
}
variable "db_pwd"{
  type = string
}
variable "rds_name" {
  type = string
}

# variable for dbsubnet rds
variable "dbsubnet_name" {
  type = string
}

# variable for security group RDS
variable "sg_name2" {
  type = string
}

# variable for route53 hosted zone
variable "hostedzone_website_name" {
  type = string
}
variable "hostzone_name" {
  type = string
}

# variable for route53 record
variable "record_website_name" {
  type = string
}
# variable for redis
variable "cluster_id_name" {
  type = string
}

# variable for security group redis
variable "sg_name1" {
  type = string
}