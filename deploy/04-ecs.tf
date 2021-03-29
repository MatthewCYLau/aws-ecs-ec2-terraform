resource "aws_ecs_cluster" "ecs_cluster" {
  name = "my-cluster"
}

data "template_file" "task_definition_template" {
  template = file("task-definitions/service.json.tpl")
}


resource "aws_ecs_task_definition" "task_definition" {
  family                   = "worker"
  container_definitions    = data.template_file.task_definition_template.rendered
  requires_compatibilities = ["EC2"]
}

resource "aws_ecs_service" "worker" {
  name            = "worker"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  launch_type     = "EC2"
  desired_count   = 1
}