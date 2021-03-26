resource "aws_cloudwatch_log_group" "desafio" {
  name              = "desafio"
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "desafio" {
  family = "desafio"

  container_definitions = <<EOF
[
  {
    "name": "desafio",
    "image": "marublaize/desafio",
    "cpu": 0,
    "memory": 128,
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "eu-west-1",
        "awslogs-group": "desafio",
        "awslogs-stream-prefix": "desafio-ecs"
      }
    }
  }
]
EOF
}

resource "aws_ecs_service" "desafio" {
  name            = "desafio"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.desafio.arn

  desired_count = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}