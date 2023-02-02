# Terraform Block
terraform {
#  required_version = "~>4.0" // Any version equal and above 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}