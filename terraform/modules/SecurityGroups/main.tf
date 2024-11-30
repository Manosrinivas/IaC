resource "aws_security_group" "TravelMemory_sg_gani" {
    name = var.sg_name
    description = "Allow inbound traffic on port 80"
    vpc_id = "TVM_VPC"
    ingress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }   
    egress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.sg_name
    }
}