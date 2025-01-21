### AWS TAGS ###
variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

### PROJECT TAGS ###

variable "project_tag" {
  type        = map(string)
  description = "Tags for the project"
  default = {
    Terraform = "true"
    Project   = "epam-tf-lab"
    Owner     = "Aleksandre_Mikashavidze"
  }
}

### VPC TAGS ###

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = map(string)
  description = "Map of public subnet CIDRs with their names"
  default = {
    public_subnet_1 = "10.0.1.0/24",
    public_subnet_2 = "10.0.2.0/24"
  }
}

variable "private_subnet_cidrs" {
  type        = map(string)
  description = "Map of private subnet CIDRs with their names"
  default = {
    private_subnet_1 = "10.0.3.0/24",
    private_subnet_2 = "10.0.4.0/24"
  }
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "linux_distro" {
  type        = string
  description = "Linux distribution for the EC2 instance"
  default     = "ubuntu"
}
