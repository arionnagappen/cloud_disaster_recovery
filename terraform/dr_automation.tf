resource "aws_cloudwatch_metric_alarm" "healthy_host_count" {
  alarm_name          = "no-healthy-hosts"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  datapoints_to_alarm = 2
  period              = 60
  threshold           = 0
  statistic           = "Average"

  alarm_description = "No Healthy Hosts Available"

  namespace   = "AWS/GlobalAccelerator"
  metric_name = "HealthyHostCount"

  dimensions = {
    Accelerator = module.global_accelerator.accelerator_arn
  }

  treat_missing_data = "notBreaching"
  alarm_actions      = []
}