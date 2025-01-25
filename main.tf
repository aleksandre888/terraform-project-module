module "vpc" {
  source = "./vpc"
  // User can pass the following inputs:
  // - vpc_cidr: CIDR block for the VPC
  // - public_subnet_cidrs: Map of public subnet CIDRs with their names
  // - private_subnet_cidrs: Map of private subnet CIDRs with their names
  // - availability_zones: List of availability zones
  // - vpc_tag_name: Tag name for the VPC
  // - public_route_table_tag: Tag name for the public route table
  // - private_route_table_tag: Tag name for the private route table
  // - internet_gateway_tag: Tag name for the internet gateway
  // - nat_gateway_tag: Tag name for the NAT gateway
}

module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id
  // User can pass the following inputs:
  // - ec2_sg_name: Name of the EC2 security group
  // - alb_sg_name: Name of the ALB security group
  // - ec2_sg_tag: Tag for the EC2 security group
  // - alb_sg_tag: Tag for the ALB security group
  // - ec2_ingress_rules: List of ingress rules for the EC2 security group
  // - ec2_egress_rules: List of egress rules for the EC2 security group
  // - alb_ingress_rules: List of ingress rules for the ALB security group
  // - alb_egress_rules: List of egress rules for the ALB security group
}

module "ec2" {
  source          = "./ec2"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  ec2_sg_id       = module.security.ec2_sg_id
  // User can pass the following inputs:
  // - ec2_instance_count: Number of EC2 Instances
  // - linux_distro: Linux distribution for the EC2 instance
  // - ami_id: AMI ID for the EC2 instance
  // - ec2_name_tag: Name tag for the EC2 instance
  // - instance_type: Instance type for the EC2 instance
  // - key_name: Name of the key pair
  // - volume_type: volume type for the root block device
  // - volume_size: Size of the root block device in GB
}

module "alb" {
  source         = "./alb"
  alb_sg_id      = module.security.alb_sg_id
  default_sg_id  = module.vpc.default_sg_id
  vpc_id         = module.vpc.vpc_id
  ec2_instances  = module.ec2.ec2_instances
  public_subnets = module.vpc.public_subnet_ids
  // User can pass the following inputs:
  // - alb_name: Name of the Application Load Balancer
  // - alb_internal: Whether the ALB is internal
  // - alb_type: Type of the Application Load Balancer
  // - alb_listener_port: Port for the ALB listener
  // - alb_listener_protocol: Protocol for the ALB listener
  // - alb_listeners: Map of ALB listeners
  // - target_group_name: Name of the target group
  // - target_group_port: Port for the target group
  // - target_group_protocol: Protocol for the target group
  // - target_group_slow_start: Slow start duration for the target group
  // - health_check_path: Path for the health check
  // - health_check_interval: Interval for the health check
  // - health_check_timeout: Timeout for the health check
  // - health_check_healthy_threshold: Healthy threshold for the health check
  // - health_check_unhealthy_threshold: Unhealthy threshold for the health check
  // - alb_tag: Tag for the ALB
  // - alb_target_group_tag: Tag for the ALB target group
}