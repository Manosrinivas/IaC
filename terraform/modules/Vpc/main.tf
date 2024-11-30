resource "aws_vpc" "TVM_VPC_gani" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc_name
    }
    
    
}


# route tables 

# Public Route Table

resource "aws_route_table" "public_tvm_gani" {
  vpc_id = aws_vpc.TVM_VPC_gani.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.TVM_IGW_gani.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Private Route Table   
 
resource "aws_route_table" "private_tvm_gani" {
  vpc_id = aws_vpc.TVM_VPC_gani.id  

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.TVM_NAT_gateway.id  
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_subnet" "public_subnet_gani" {
    vpc_id     = aws_vpc.TVM_VPC_gani.id  
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true
    tags = {
        Name = "TVM_Public_Subnet"
    }
}

resource "aws_subnet" "private_subnet_gani" {
    vpc_id     = aws_vpc.TVM_VPC_gani.id  
    cidr_block = "10.0.0.0/16"
    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "TVM_Private_Subnet"
    } 
}

resource "aws_internet_gateway" "TVM_IGW_gani" {
    vpc_id = aws_vpc.TVM_VPC_gani.id
    tags = {
        Name = "TVM_IGW"
    }
}

resource "aws_eip" "TVM_EIP_gani" {
    tags = {
        Name = "TVM_EIP"
    }
  
}
resource "aws_nat_gateway" "TVM_NAT_gateway" {
    allocation_id = aws_eip.TVM_EIP_gani.id
    subnet_id     = aws_subnet.public_subnet_gani.id
    tags = {
        Name = "TVM_NAT_Gateway"
    }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet_gani.id 
  route_table_id = aws_route_table.public_tvm_gani.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet_gani.id 
  route_table_id = aws_route_table.private_tvm_gani.id
}