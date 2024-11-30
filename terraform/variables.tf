variable "aws_region" {
    description = "The AWS region to deploy resources."
    default     = "ap-northeast-2"
}

variable "KeyPair" {
    description = "The key pair to use for the EC2 instance."
    default = "ChrisEvans" 
}

variable "FrontendInstance_Name" {
    description = "The name of the EC2 instance."
    default     = "TVM_Frontend"
}

variable "BackendInstance_Name" {
    description = "The name of the EC2 instance."
    default     = "TVM_Backend"
}
variable "MongoDBInstance_Name" {
    description = "The name of the EC2 instance."
    default     = "TVM_MongoDB"
}

variable "sg_name" {
    description = "The name of the security group."
    default     = "TVM_SG"
}

variable "vpc_name" {
    description = "The name of the VPC."
    default     = "TVM_VPC"
}

variable "Instance_AMI" {
    description = "The AMI to use for the EC2 instance."
    default     = "ami-042e76978adeb8c48"
}

variable "instance_type" {
    description = "The type of EC2 instance to launch."
    default     = "t2.micro"
  
}