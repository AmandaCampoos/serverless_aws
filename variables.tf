variable "region" {
  description = "Região da AWS para deploy"
  type        = string
  default     = "us-east-1"
}
variable "notification_email" {
  description = "E-mail para receber notificações do SNS"
  type        = string
}

