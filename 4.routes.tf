###### public RT
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "Default-RT"
  }
}

resource "aws_route_table_association" "rt-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.RT.id
}
resource "aws_route_table_association" "rt-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.RT.id
}

############ privatr RT
resource "aws_route_table" "pr-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "privatr-RT"
  }
}


resource "aws_route_table_association" "pr-rt-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.pr-rt.id
}
resource "aws_route_table_association" "pr-rt-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.pr-rt.id
}

