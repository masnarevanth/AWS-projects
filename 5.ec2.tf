resource "aws_instance" "ec2-1" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  private_ip                  = "10.1.1.100"
  subnet_id                   = aws_subnet.public-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = true

  tags = {
    Name = "web-server"
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo su -
  amazon-linux-extras install nginx1.12 -y
  systemctl enable nginx --now
  echo "<div><h1>$(cat /etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
EOF
}

######## ec2
resource "aws_instance" "ec2-2" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  private_ip                  = "10.1.10.100"
  subnet_id                   = aws_subnet.private-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = true

  tags = {
    Name = "APP-server"
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo su -
  amazon-linux-extras install nginx1.12 -y
  systemctl enable nginx --now
  echo "<div><h1>$(cat /etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
EOF
}


######### ec2
resource "aws_instance" "ec2-3" {
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  private_ip                  = "10.1.20.100"
  subnet_id                   = aws_subnet.private-subnet-2.id
  vpc_security_group_ids      = [aws_security_group.SG.id]
  associate_public_ip_address = true

  tags = {
    Name = "DB-server"
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo su -
  amazon-linux-extras install nginx1.12 -y
  systemctl enable nginx --now
  echo "<div><h1>$(cat /etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
EOF
}
