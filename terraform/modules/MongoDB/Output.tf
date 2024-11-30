output "Frontend_PublicIP" {
    value = aws_instance.TVM_MongoDB.public_ip
}