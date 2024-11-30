resource "aws_instance" "TVM_MongoDB" {
    ami           = var.Instance_AMI
    instance_type = "t2.micro"
    key_name      = var.KeyPair
    tags = {
        Name = var.MongoDBInstance_Name
    }
    security_groups = ["TVM_SG"]
    subnet_id = "TVM_Public_Subnet"
    associate_public_ip_address = true
}