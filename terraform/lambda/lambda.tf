resource "aws_lambda_function" "reclamacao_lambda" {
  function_name = "processa_reclamacao"
  runtime       = "python3.12"
  role = var.lambda_role_arn
  handler       = "handler.lambda_handler"

 filename         = "${path.module}/../../lambda_src/lambda.zip"
source_code_hash = filebase64sha256("${path.module}/../../lambda_src/lambda.zip")


  timeout = 10
}
