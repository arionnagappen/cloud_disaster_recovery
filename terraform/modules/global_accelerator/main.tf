// ACCELERATOR //
resource "aws_globalaccelerator_accelerator" "global_accelerator" {
  name = var.global_accelerator_name
  enabled = true
  ip_address_type = var.global_accelerator_ip_address_type
}

// LISTENER //
resource "aws_globalaccelerator_listener" "global_accelerator_listener" {
  port_range {
    from_port = var.global_accelerator_from_port
    to_port = var.global_accelerator_to_port
  }
  
  protocol = var.global_accelerator_protocol
  accelerator_arn = aws_globalaccelerator_accelerator.global_accelerator.arn
}

// ENDPOINT GROUP //
resource "aws_globalaccelerator_endpoint_group" "global_accelerator_endpoint_group" {
  listener_arn = aws_globalaccelerator_listener.global_accelerator_listener.arn

  endpoint_group_region = var.global_accelerator_endpoint_region

  endpoint_configuration {
    client_ip_preservation_enabled = true
    endpoint_id = var.global_accelerator_endpoint_id
    weight = 100
  }

  // Health Checks //
  health_check_port = var.global_accelerator_health_check_port
  health_check_protocol = var.global_accelerator_health_check_protocol
  health_check_path = var.global_accelerator_health_check_path
  health_check_interval_seconds = var.global_accelerator_health_check_interval
}
