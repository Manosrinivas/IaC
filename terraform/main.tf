terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.70.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
}

module "vpc" {
    source = "./modules/Vpc"
    vpc_name = var.vpc_name
}

module "SecurityGroups" {
    source = "./modules/SecurityGroups"
    sg_name = var.sg_name 
}

module "Frontend" {
    source = "./modules/Frontend"
    Instance_AMI = var.Instance_AMI
    instance_type = var.instance_type
    KeyPair = var.KeyPair
    FrontendInstance_Name = var.FrontendInstance_Name 
}

module "Backend" {
    source = "./modules/Backend"
    Instance_AMI = var.Instance_AMI
    instance_type = var.instance_type
    KeyPair = var.KeyPair
    BackendInstance_Name = var.BackendInstance_Name 
}


