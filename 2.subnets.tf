
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet-1
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet-1"
  }
}


resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet-2
  availability_zone = "us-east-1b"

  tags = {
    Name = "public-subnet-2"
  }
}



resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet-1
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet-1"
  }
}



resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet-2
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-2"
  }
}
