terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "=5.5.0"
    }
  }
}


provider "aws" {
  region = "canada-central"
  access_key = ""
}