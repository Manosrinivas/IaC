variable "Instance_AMI" {
    description = "The AMI to use for the EC2 instance."
}

variable "instance_type" {
    description = "The type of EC2 instance to launch."
  
}

variable "KeyPair" {
    description = "The key pair to use for the EC2 instance."
}

variable "FrontendInstance_Name" {
    description = "The name of the EC2 instance."
  
}