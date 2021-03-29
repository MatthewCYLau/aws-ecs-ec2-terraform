resource "aws_launch_configuration" "ecs_launch_config" {
  image_id                    = "ami-09a3cad575b7eabaa"
  iam_instance_profile        = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:instance-profile/ecsInstanceRole"
  security_groups             = [aws_security_group.ecs_sg.id]
  user_data                   = "#!/bin/bash\necho ECS_CLUSTER=my-cluster >> /etc/ecs/ecs.config"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
}

resource "aws_autoscaling_group" "ecs_ec2_asg" {
  name                 = "ECS EC2 ASG"
  vpc_zone_identifier  = [aws_subnet.pub_subnet.id]
  launch_configuration = aws_launch_configuration.ecs_launch_config.name

  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
}