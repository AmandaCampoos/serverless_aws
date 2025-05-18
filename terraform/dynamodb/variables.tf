variable "table_name" {
  description = "Nome da tabela DynamoDB"
  type        = string
  default     = "reclamacoes"
}

variable "environment" {
  description = "Ambiente do recurso"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Nome do projeto"
  type        = string
  default     = "projeto-serverless"
}
