variable "lambda_function_name" {
  description = "Nome da função Lambda monitorada"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN do tópico SNS para envio de alertas"
  type        = string
}

variable "region" {
  description = "Região AWS usada"
  type        = string
  default     = "us-east-1"
}
