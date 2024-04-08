resource "aws_iam_role" "main_role" {
  name = "${var.app_name}_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "dms.amazonaws.com"
          type    = "Service"
        }
      },
    ]
  })

  tags = {
    Name = "${var.app_name}-app-iam-role"
  }
}
