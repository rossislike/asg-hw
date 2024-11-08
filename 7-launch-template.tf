resource "aws_launch_template" "launch_template" {
  name          = "ASG01-TG01-Template"
  description   = "ASG01-TG01-Template"
  key_name      = "ASG01-TG01-Template"
  image_id      = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  user_data     = filebase64("${path.module}/box2d_userdata")
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
  }
  vpc_security_group_ids = [aws_security_group.sg_asg01_tg01.id]
  iam_instance_profile {
    arn = "arn:aws:iam::442359104502:instance-profile/Box2dRole"
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ASG01-instance"
    }
  }
}