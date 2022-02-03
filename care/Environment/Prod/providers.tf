terraform {
  required_version = "1.1.3"
  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>3.71.0"
    }
  }
  backend "s3" {
    bucket = ""# add bucket name after creating them in console
    key    = "Prod/statefiles.tf"
    region = "eu-west-3"
    
  }
}

provider "aws" {
 region = var.aws_region 
}