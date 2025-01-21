data "aws_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  filter {
    name   = "group-name"
    values = ["default"]
  }
}