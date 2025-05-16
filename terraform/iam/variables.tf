variable "lambda_policy_name" {
  description = "Nome da política IAM da Lambda"
  type        = string
}

variable "lambda_role_name" {
  description = "Nome da role IAM da Lambda"
  type        = string
}
variable "lambda_arn" {
  description = "ARN da função Lambda para a Step Function"
  type        = string
}
