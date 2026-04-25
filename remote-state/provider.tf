terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "learning-devopsfrom-scratch"
    key = "learning-terraform-devopstool"  # you should have unique keys with in the bucket, same key should not be used in other repos or tf projects
    region = "us-east-1"
    dynamodb_table = "terraform-table-devops-locking"
    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
