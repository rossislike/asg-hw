resource "aws_alb_target_group" "tg_asg01_tg01" {
  name        = "ASG01-TG01"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"

  vpc_id = aws_vpc.ginjo_vpc.id
  tags = {
    Name = "ASG01-TG01"
  }
}