# Calling the Child module from the public module stored in the registry

# Create the VPC Terraform Module 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws//examples/complete-vpc"
  version = "3.19.0"


  # Basic VPC Details 
  cidr            = "10.0.0.0/16"
  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]

  # Database Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true //want a seperate RT to be created for each DB
  database_subnets                   = ["10.0.110.0/24", "10.0.120.0/24", "10.0.130.0/24"]

  # Following are set to false as default hence not needed - want no access to internet for db
  create_database_nat_gateway_route      = false //if nat gw should be created to give internet access to db
  create_database_internet_gateway_route = false //if nat gw should be created to give db internet access

  # NAT gateways - Outbound Communication
  enable_nat_gateway = true // For out private subnets
  single_nat_gateway = true // In production env this will be set to false for HA 

  # VPC DNS parameters
  enable_dns_support   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    type = "public-subents"
  }

  private_subnet_tags = {
    type = "private-subets"
  }

  database_subnet_tags = {
    type = "database-subnets"
  }

  vpc_tags = {
    type = "vpc-dev"
  }

}

