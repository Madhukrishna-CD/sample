output "vpc" {
    value = aws_vpc.vpc
    description = "vpc output" 
}

output "public_subnet1" {
    value = aws_subnet.public_subnet1
    description = "output for public subnet 1"
}

output "public_subnet2" {
    value = aws_subnet.public_subnet2
    description = "output for public subnet 2"
}

output "private_subnet1" {
    value = aws_subnet.private_subnet1
    description = "output for private subnet 1"
}

output "private_subnet2" {
    value = aws_subnet.private_subnet2
    description = "output for private subnet 2"
}

output "private_subnet3" {
    value = aws_subnet.private_subnet3
    description = "output for private subnet 3"
}

output "private_subnet4" {
    value = aws_subnet.private_subnet4
    description = "output for private subnet 4"
}

output "private_subnet5" {
    value = aws_subnet.private_subnet5
    description = "output for private subnet 5"
}

output "ec2_instance" {
    value = aws_instance.ec2
    description = "output for instance"
}

output "launch_configuration" {
    value = aws_launch_configuration.ec2_webservers
    description = "output for autoscaling launch configuration"
}

output "autoscaling_group" {
    value = aws_autoscaling_group.as_group
    description = "output for autoscaling group"
}

output "autoscaling_policy" {
    value = aws_autoscaling_policy.policy
    description = "output for autoscaling policy"
}

output "cloudwatch_alaram" {
    value = aws_cloudwatch_metric_alarm.cloudwatch_alaram
    description = "output for autoscaling cloudwatach alaram"
}

output "eip" {
    value = aws_eip.eip
    description = "output for eip route53"
}

output "redis" {
    value = aws_elasticache_cluster.elasticcache
    description = "output for elastic cache "
}

output "alb" {
    value = aws_lb.alb
    description = "output for Application loadbalancer "
}

output "sg-alb" {
    value = aws_security_group.security_group
    description = "output for security group alb "
}

output "db_instance" {
    value = aws_db_instance.rds_hub
    description = "output for db instance"
    sensitive   = true
}

output "db_parameter_group" {
    value = aws_db_parameter_group.mysql
    description = "output for db parameter group"
}

output "db_subnet_group" {
    value = aws_db_subnet_group.sg_group
    description = "output for db subnet group"
}

output "hosted_zone" {
    value = aws_route53_zone.hostedzone
    description = "output for route 53 hosted zone"
}

output "route53_record" {
    value = aws_route53_record.record
    description = "output for route 53 record"
}

