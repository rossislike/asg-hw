resource "aws_autoscaling_group" "asg" {
  name                      = "ASG01"
  max_size                  = 10
  min_size                  = 4
  desired_capacity          = 6
  health_check_grace_period = 300
  default_instance_warmup   = -1

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Default"
  }

  vpc_zone_identifier = [aws_subnet.prv_subnet_1a.id, aws_subnet.prv_subnet_1b.id]
  health_check_type   = "ELB"
  target_group_arns   = [aws_alb_target_group.tg_asg01_tg01.arn]

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 100
  }

  tag {
    key                 = "name"
    value               = "ASG01"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg_policy" {
  name                   = "Target Tracking Policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    disable_scale_in = false
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75
  }
}