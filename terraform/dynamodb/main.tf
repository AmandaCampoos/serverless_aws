resource "aws_dynamodb_table" "reclamacoes" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}
