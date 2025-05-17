output "api_url" {
  value = "https://${aws_api_gateway_rest_api.reclamacoes_api.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_stage.prod.stage_name}/reclamacao"
}
