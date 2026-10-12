resource "aws_autoscaling_group" "asg" {
  name                      = "project-asg"
  max_size                  = 6
  min_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.appA.id, aws_subnet.appB.id, aws_subnet.appC.id]

  target_group_arns = [aws_lb_target_group.tg.arn]

  launch_template {
    name    = aws_launch_template.lt.name
    version = "$Latest"
  }

  tag {
    key                 = "project"
    value               = "ins"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg-policy" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  name                   = "asg-policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    target_value = 70
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
  }
}