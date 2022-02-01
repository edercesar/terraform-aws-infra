provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4AC3LCBKEI6YN6B5"
    secret_key = "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"
}

resource "aws_vpc" "myfirst-vpc" {
    cidr_block = "10.121.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "VPC Padrão -TF"
        
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.myfirst-vpc.id
    cidr_block = "10.121.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Subnet Publica - TF"
    }
}

resource "aws_internet_gateway" "MeuIGW" {
    vpc_id = aws_vpc.myfirst-vpc.id

    tags = {
        Name = "Internet Gateway - TF"
    }
  
}

resource "aws_route_table" "rota_us_east_1a_public" {
vpc_id = aws_vpc.myfirst-vpc.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.MeuIGW.id
}

tags = {
    Name = "Rota para Rede Publica - TF"
}
}

resource "aws_route_table_association" "subnet_useast1a_public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.rota_us_east_1a_public.id
}


