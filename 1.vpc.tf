resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}

######### internet gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IGW"
  }
}

############ EIP
resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = "EIP"
  }
}


############ NAT gateway

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "NAT"
  }
}
