// GLOBAL ACCELERATOR //
variable "global_accelerator_name" {
  type = string
  description = "Global Accelerator Name"
}

variable "global_accelerator_ip_address_type" {
  type = string
  description = "Global Accelerator IP Address Type"
}

// GLOBAL ACCELERATOR LISTENER //
variable "global_accelerator_from_port" {
  type = number
  description = "Port to accept traffic on"
}

variable "global_accelerator_to_port" {
  type = number
  description = "Port to forward traffic on"
}

variable "global_accelerator_protocol" {
  type = string
  description = "Uses either TCP or UDP protocol"
}

// ENDPOINT GROUP //
variable "global_accelerator_endpoint_region" {
  type = string
  description = "Global Accelerator Endpoint Region"
}

variable "global_accelerator_endpoint_id" {
  type = string
  description = "ID of the Endpoint Resource"
}

variable "global_accelerator_health_check_port" {
  type = string
  description = "Global Accelerator Health Check Port"
}

variable "global_accelerator_health_check_protocol" {
  type = string
  description = "Global Accelerator Health Check Protocol"
}
variable "global_accelerator_health_check_path" {
  type = string
  description = "Global Accelerator Health Check Path"
}

variable "global_accelerator_health_check_interval" {
  type = number
  description = "Global Accelerator Health Check Intervals In Seconds"
}