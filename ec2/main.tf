resource "aws_instance" "web-instance" {
  count = var.ec2_instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element([for subnet in var.private_subnets : subnet], count.index)
  key_name               = var.key_name
  vpc_security_group_ids = [var.ec2_sg_id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "web-instance-${count.index}"
  }

  user_data = base64encode(data.template_file.user_data.rendered)
}