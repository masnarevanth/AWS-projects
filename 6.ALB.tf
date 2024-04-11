#####  instance Target-group
resource "aws_lb_target_group" "test" {
  name        = "LB-TG"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
  tags = {
    Name = "TG"
  }
}


######### Attachment
resource "aws_lb_target_group_attachment" "ec2_attach-1" {
  count            = 1
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.ec2-2.id
  port             = 80
}


######### Attachment
resource "aws_lb_target_group_attachment" "ec2_attach-2" {
  count            = 1
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.ec2-3.id
  port             = 80
}



# ######## Listener
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.example.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}


###### ALB
resource "aws_lb" "example" {
  name               = "ALB"
  load_balancer_type = "application"
   security_groups    = [aws_security_group.SG.id]

  subnet_mapping {
    subnet_id = aws_subnet.public-subnet-1.id
    #allocation_id = aws_eip.example1.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.public-subnet-2.id
    #allocation_id = aws_eip.example2.id
  }
}