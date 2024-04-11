resource "aws_security_group" "SG" {
  name        = "SG"
  description = "Allow All inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "SG"
  }


  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}