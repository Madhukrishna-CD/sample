resource "aws_elasticache_cluster" "elasticcache" {
  cluster_id           = var.cluster_id_name
  engine               = "redis"
  node_type            = "cache.r5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.sg_elastic.name
  availability_zone_placement = ""
}



# create a subnet group for elasticache
resource "aws_elasticache_subnet_group" "sg_elastic" {
  name       = "cache-subnet"
  subnet_ids = [aws_subnet.private_subnet2.id, aws_subnet.private_subnet5.id]
}

# create a security group

resource "aws_security_group" "sg" {
  name        = var.sg_name1
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 6379
    to_port          = 6379
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