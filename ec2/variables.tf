variable "ec2_instance_count" {
  type        = number
  description = "Number of EC2 Instances"
  default     = 2
}

variable "linux_distro" {
  type        = string
  description = "Linux distribution for the EC2 instance"
  default     = "ubuntu"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-005fc0f236362e99f"
}

variable "ec2_name_tag" {
  type        = string
  description = "Name tag for the EC2 instance"
  default     = "web-instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the key pair"
  default     = "web-key"
}

variable "volume_type" {
  type        = string
  description = "List of volume types for the root block device"
  default     = "gp3"
}

variable "volume_size" {
  type        = number
  description = "Size of the root block device in GB"
  default     = 8
}

variable "vpc_id" {
  description = "The ID of the VPC, this value be inherited from the outputs of the vpc module"
  type        = string
}

variable "ec2_sg_id" {
  description = "The ID of ec2_sg_id, this value will be inherited from the output of the security module"
  type = string
}

variable "private_subnets" {
  description = "List of private subnet IDs, this value will be inherited from the outputs of the vpc module"
  type        = list(string)
}