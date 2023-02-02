

build three tier vpc in aws with web, app and db. will create it using the VPC, internet gateway, nat gateway, elastic IP address, route table, public subnets, private subnets.

manual build - will help to know what we are exactly doing.

![Screenshot](docs/image.png)

Step-01: Introduction 
Understand Terraform Modules
Create VPC using terraform modules
Define input variables for VPC modules and reference them in VPC Terraform Moudule
Define local values and reference them in VPC Terraform Module
Create terraform.tfvars to load variable values by default from this file
Create vpc.auto.tfvars to load variables values by default from this file related to a VPC
Define Output Values for the VPC