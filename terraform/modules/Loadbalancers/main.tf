# Create Load Balancer
resource "aws_lb" "app_lb" {
  name               = "app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_sg.id]
  subnets            = aws_subnet.app_subnet[*].id

  enable_deletion_protection = false

  tags = {
    Name = "app-load-balancer"
  }
}

# Create Target Group
resource "aws_lb_target_group" "app_tg" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "app-target-group"
  }
}

# Attach Instances to Target Group
resource "aws_lb_target_group_attachment" "app_target_attachment" {
  count            = 2  # Adjust the count based on the number of instances
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.frontend.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_target_attachment_backend" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.backend.id
  port             = 80
}

# Data source for availability zones
data "aws_availability_zones" "available" {}
