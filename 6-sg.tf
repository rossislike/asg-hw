resource "aws_security_group" "sg_asg01_tg01" {
  name        = "ASG01-TG01"
  description = "ASG01-TG01"
  vpc_id      = aws_vpc.ginjo_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ASG01-TG01"
  }
}

resource "aws_security_group" "sg_asg01_lb01" {
  name        = "ASG01-LB01"
  description = "ASG01-LB01"
  vpc_id      = aws_vpc.ginjo_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ASG01-LB01"
  }
}