resource "aws_sagemaker_notebook_instance" "model_developer" {
  name          = "SNP500ModelDeveloper"
  role_arn      = aws_iam_role.sagemaker_role.arn
  instance_type = "ml.t2.medium"
}

resource "aws_iam_role" "sagemaker_role" {
  name = "sagemaker_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      },
    ]
  })
}
