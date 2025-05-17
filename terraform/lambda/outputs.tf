output "lambda_arn" {
  description = "ARN da função Lambda"
  value       = aws_lambda_function.reclamacao_lambda.arn
}
output "lambda_name" {
  value = aws_lambda_function.reclamacao_lambda.function_name
}


