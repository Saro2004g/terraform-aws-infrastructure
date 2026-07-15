resource "aws_autoscaling_group" "web_asg" {
  name             = "web-asg"
  desired_capacity = 2
  min_size         = 1
  max_size         = 3

  vpc_zone_identifier = [
    var.subnet_id
  ]

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}
