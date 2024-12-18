terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "vpc-ven-dev"
    key = "vpc-ven-apps"
    region = "us-east-1"
    dynamodb_table = "vpc-ven-dev-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}