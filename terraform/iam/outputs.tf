
output "lambda_role_arn" {
  description = "ARN da role da Lambda"
  value       = aws_iam_role.lambda_exec_role.arn
}
output "step_function_role_arn" {
  value = aws_iam_role.step_function_role.arn
}
