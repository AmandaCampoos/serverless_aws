resource "aws_api_gateway_rest_api" "reclamacoes_api" {
  name        = "reclamacoes_api"
  description = "API para receber reclamações de usuários"
}

resource "aws_api_gateway_resource" "reclamacao" {
  rest_api_id = aws_api_gateway_rest_api.reclamacoes_api.id
  parent_id   = aws_api_gateway_rest_api.reclamacoes_api.root_resource_id
  path_part   = "reclamacao"
}

resource "aws_api_gateway_method" "post_reclamacao" {
  rest_api_id   = aws_api_gateway_rest_api.reclamacoes_api.id
  resource_id   = aws_api_gateway_resource.reclamacao.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.reclamacoes_api.id
  resource_id             = aws_api_gateway_resource.reclamacao.id
  http_method             = aws_api_gateway_method.post_reclamacao.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"

}

resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.reclamacoes_api.execution_arn}/*/*"
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on  = [aws_api_gateway_integration.lambda_integration]
  rest_api_id = aws_api_gateway_rest_api.reclamacoes_api.id
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.reclamacoes_api.id
  stage_name    = "prod"
}
