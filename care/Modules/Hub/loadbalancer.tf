resource "aws_lb" "alb" {
  name               = "CSG-BMS-BETA-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group.id]
  subnets            = [aws_subnet.public_subnet1.id, aws_subnet.public_subnet2.id]
  tags = {
    Environment = "${var.alb_name}"
  }
}
# creating a security group ALB
resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = "inbound traffic"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "HTTP"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTPS"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# create a target groups
resource "aws_lb_target_group" "alb_tg" {
  name     = "alb_tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "tg_instance" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_launch_configuration.ec2_webservers.id
  port             = 80
}

resource "aws_lb_listener" "tg_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_tg.arn}"
  }
}
