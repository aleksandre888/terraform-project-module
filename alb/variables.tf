### ALB VARIABLES ###

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
  default     = "alb"
}

variable "alb_internal" {
  type        = bool
  description = "Whether the ALB is internal"
  default     = false
}

variable "alb_type" {
  type        = string
  description = "Type of the Application Load Balancer"
  default     = "application"
}

variable "alb_listener_port" {
  type        = number
  description = "Port for the ALB listener"
  default     = 80
}

variable "alb_listener_protocol" {
  type        = string
  description = "Protocol for the ALB listener"
  default     = "HTTP"
}

variable "alb_listeners" {
  type = map(object({
    port     = number
    protocol = string
  }))
  description = "Map of ALB listeners"
  default = {
    http = {
      port     = 80
      protocol = "HTTP"
    }
  }
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group"
  default     = "target"
}

variable "target_group_port" {
  type        = number
  description = "Port for the target group"
  default     = 80
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol for the target group"
  default     = "HTTP"
}

variable "target_group_slow_start" {
  type        = number
  description = "Slow start duration for the target group"
  default     = 30
}

variable "health_check_path" {
  type        = string
  description = "Path for the health check"
  default     = "/"
}

variable "health_check_interval" {
  type        = number
  description = "Interval for the health check"
  default     = 45
}

variable "health_check_timeout" {
  type        = number
  description = "Timeout for the health check"
  default     = 5
}

variable "health_check_healthy_threshold" {
  type        = number
  description = "Healthy threshold for the health check"
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  type        = number
  description = "Unhealthy threshold for the health check"
  default     = 3
}

variable "alb_tag" {
  type        = string
  description = "Tag for the ALB"
  default     = "alb"
}

variable "alb_target_group_tag" {
  type        = string
  description = "Tag for the ALB target group"
  default     = "alb-target-group"
}

### ALB SECURITY GROUP VARIABLES ###

variable "alb_sg_name" {
  type        = string
  description = "Name of the ALB security group"
  default     = "alb-sg"
}

variable "alb_sg_id" {
  description = "The ID of the ALB security group, this value be inherited from the outputs of the security module"
  type        = string
}

variable "default_sg_id" {
  description = "The ID of the Default Security Group, this value be inherited from the outputs of the security module"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC, this value be inherited from the outputs of the vpc module"
  type        = string
}

variable "ec2_instances" {
  description = "EC2 Instances, this value will be inherited from the output of the ec2 module"
  type = any
}

variable "public_subnets" {
  description = "Public Subnet ids, value from module vpc"
  type = any
}