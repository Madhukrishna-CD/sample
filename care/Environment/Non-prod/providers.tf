terraform {
  required_version = "1.1.3"
  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>3.1.0"
    }
  }
  backend "s3" {
    bucket = "csg-devops-terraform-statefile"
    key    = "hubs/statefiles.tf"
    region = "ap-south-1"
    
  }
}

provider "aws" {
  region = var.aws_region 
  access_key = "AKIARXHDXABBFCSDFJ5X"
  secret_key = "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"
}