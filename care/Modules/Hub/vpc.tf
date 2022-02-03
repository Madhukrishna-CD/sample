resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "ig"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = "eu-west-3a" 
 
  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = "eu-west-3b"
 
  tags = {
    Name = "${var.public_subnet2_name}"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = "eu-west-3a"
 
  tags = {
    Name = "${var.private_subnet1_name}"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = "eu-west-3a"

  tags = {
    Name = "${var.private_subnet2_name}"
  }
}

resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet3_cidr
  availability_zone = "eu-west-3a"

  tags = {
    Name = "${var.private_subnet3_name}"
  }
}

resource "aws_subnet" "private_subnet4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet4_cidr
  availability_zone = "eu-west-3b"

  tags = {
    Name = "${var.private_subnet4_name}"
  }
}

resource "aws_subnet" "private_subnet5" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet5_cidr
  availability_zone = "eu-west-3b"

  tags = {
    Name = "${var.private_subnet5_name}"
  }
}


# Create a Endpoint for VPC
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.eu-west-3.s3"

  tags = {
    Environment = "Non_prod"
  }
}