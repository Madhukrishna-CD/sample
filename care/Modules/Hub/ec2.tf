
resource "aws_instance" "ec2" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.private_subnet3.id
  
  tags = {
    name = "${var.instance_name}"
  }
}

# create sg for ec2
resource "aws_security_group" "sg" {
  name        = "${var.sg_name[0]}"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Create an eip 
resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id
  vpc      = true
}

# Auto scaling lauch config

resource "aws_launch_configuration" "ec2_webservers" {
  name_prefix   = "CSG-BMS-BETA-MASTER"
  image_id      = var.imageid_launch_configuration
  instance_type = var.launch_instance_type

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_placement_group" "group" {
  name     = var.placement_group_name
  strategy = "cluster"
}
resource "aws_autoscaling_group" "as_group" {
  name                      = var.autoscaling_group_name
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  placement_group           = aws_placement_group.group.id
  launch_configuration      = aws_launch_configuration.ec2_webservers.name
  vpc_zone_identifier       = [aws_subnet.private_subnet1.id,aws_subnet.private_subnet4.id]
  
  tag{
    key = "EC2"
    value = "ec2instances"
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "policy" {
  name                   = var.policy_name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.as_group.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_alaram" {
  alarm_name          = var.cloudwatch_alaram
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.as_group.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.policy.arn]
  actions_enabled = true
}

