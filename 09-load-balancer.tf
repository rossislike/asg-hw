resource "aws_lb" "load_balancer" {
  name = "ASG01-LB01"

  subnet_mapping {
    subnet_id = aws_subnet.pub_subnet_1a.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.pub_subnet_1b.id
  }

  security_groups    = [aws_security_group.sg_asg01_lb01.id]
  load_balancer_type = "application"

  tags = {
    Environment = "ginjo_alb"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg_asg01_tg01.arn
  }

  tags = {
    Name = "ginjo_alb_listener"
  }
}

output "public_dns_name" {
  description = "Public DNS names of the load balancer for this project"
  value       = "http://${aws_lb.load_balancer.dns_name}"
}

