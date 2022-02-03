resource "aws_db_instance" "rds_hub" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.r5.large"
  name                 = var.rds_name
  username             = var.db_username
  password             = var.db_pwd
  parameter_group_name = aws_db_parameter_group.mysql.name
  db_subnet_group_name = aws_db_subnet_group.sg_group.name
  skip_final_snapshot  = true
  multi_az = true
}

# create parameter group
resource "aws_db_parameter_group" "mysql" {
  name   = "custom-mysql-parameter-group"
  family = "mysql5.7"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
}
#create subnet
resource "aws_db_subnet_group" "sg_group" {
  name       = "csg-beta-mysql-sub"
  subnet_ids = [aws_subnet.private_subnet2.id,aws_subnet.private_subnet5.id]

  tags = {
    Name = "${var.dbsubnet_name}"
  }
}

# create a security group
resource "aws_security_group" "sg" {
  name        = var.sg_name2
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
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
