resource "aws_ecr_repository" "gatus" {
  name = "${local.name}-app"

  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}

resource "aws_ecr_lifecycle_policy" "gatus" {
  repository = aws_ecr_repository.gatus.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1

        description = "Keep the most recent 30 images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 30
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}
