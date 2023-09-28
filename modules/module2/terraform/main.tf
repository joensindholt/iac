terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "joensindholt-iac"
    key    = "module-2.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
}

resource "aws_vpc" "module2-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "joensindholt-iac-vpc-${terraform.workspace}"
  }
}
