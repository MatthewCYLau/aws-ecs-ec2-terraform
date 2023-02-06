locals {
  instance_ami = data.aws_ami.ecs_ami.id
  tags = {
    Environment = var.environment
    Application = var.app_name
  }
  vpc_cidr = "10.0.0.0/16"
}