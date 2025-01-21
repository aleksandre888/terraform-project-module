### SECURITY GROUP NAMES ###

variable "ec2_sg_name" {
  type        = string
  description = "Name of the EC2 security group"
  default     = "ec2-sg"
}

variable "alb_sg_name" {
  type        = string
  description = "Name of the ALB security group"
  default     = "alb-sg"
}

variable "ec2_sg_tag" {
  type        = string
  description = "Tag for the EC2 security group"
  default     = "ec2-security-group"
}

variable "alb_sg_tag" {
  type        = string
  description = "Tag for the ALB security group"
  default     = "alb-security-group"
}


### SECURITY GROUP RULES ###

variable "ec2_ingress_rules" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = optional(list(string), [])
  }))
  description = "List of ingress rules for the EC2 security group"
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = []
    },
    {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = ["alb_sg_placeholder"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "ec2_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of egress rules for the EC2 security group"
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "alb_ingress_rules" {
  type = list(object({
    from_port       = number,
    to_port         = number,
    protocol        = string,
    cidr_blocks     = list(string),
    security_groups = optional(list(string), [])
  }))
  description = "List of ingress rules for the ALB security group"
  default = [{
    from_port   = 80,
    to_port     = 80,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "alb_egress_rules" {
  type = list(object({
    from_port       = number,
    to_port         = number,
    protocol        = string,
    cidr_blocks     = list(string),
    security_groups = optional(list(string), [])
  }))
  description = "List of egress rules for the ALB security group"
  default = [{
    from_port   = 0,
    to_port     = 0,
    protocol    = "-1",
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "vpc_id" {
  description = "The ID of the VPC, this value be inherited from the outputs of the vpc module"
  type        = string
}