variable "lambda_arn" {
  description = "ARN da função Lambda"
  type        = string
}

variable "step_function_role_arn" {
  description = "ARN da IAM Role da Step Function"
  type        = string
}
