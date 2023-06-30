terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=5.5.0"
    }
  }
}


provider "aws" {
  region                   = "ca-central-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"

}

resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_prefix[0].cidr_block
  availability_zone = "ca-central-1a"

  tags = {
    Name = var.subnet_prefix[0].name
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_prefix[1].cidr_block
  availability_zone = "ca-central-1a"

  tags = {
    Name = var.subnet_prefix[1].name
  }
}