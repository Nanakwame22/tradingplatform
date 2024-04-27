resource "aws_lambda_function" "data_collector" {
  function_name = "SNP500DataCollector"

  s3_bucket = aws_s3_bucket.data_bucket.id
  s3_key    = "lambda.zip"

  handler = "index.handler"
  runtime = "python3.8"

  role = aws_iam_role.lambda_execution_role.arn
}