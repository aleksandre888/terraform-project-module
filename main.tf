module "vpc" {
  source = "./vpc"

}

module "security" {
  source = "./security"
  vpc_id = module.vpc.vpc_id

}

module "ec2" {
  source = "./ec2"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnet_ids
  ec2_sg_id = module.security.ec2_sg_id

}

module "alb" {
  source = "./alb"
  alb_sg_id     = module.security.alb_sg_id
  default_sg_id = data.aws_security_group.default.id
  vpc_id = module.vpc.vpc_id
  ec2_instances = module.ec2.ec2_instances
  public_subnets = module.vpc.public_subnet_ids

}