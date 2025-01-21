variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_tag_name" {
  type        = string
  description = "Tag name for the VPC"
  default     = "private-vpc"
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

variable "public_route_table_tag" {
  type        = string
  description = "Tag name for the public route table"
  default     = "public-route-table"
}

variable "private_route_table_tag" {
  type        = string
  description = "Tag name for the private route table"
  default     = "private-route-table"
}

variable "internet_gateway_tag" {
  type        = string
  description = "Tag name for the internet gateway"
  default     = "internet-gateway"
}

variable "nat_gateway_tag" {
  type        = string
  description = "Tag name for the NAT gateway"
  default     = "nat-gateway"
}