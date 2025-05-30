resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "ErrosLambdaReclamacoes"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Alarme para erros na Lambda reclamacao_lambda"
  dimensions = {
    FunctionName = var.lambda_function_name
  }
  alarm_actions = [var.sns_topic_arn]
}

resource "aws_cloudwatch_metric_alarm" "lambda_duration" {
  alarm_name          = "DuracaoAltaLambdaReclamacoes"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "Average"
  threshold           = 5000 # 5 segundos, ajuste conforme necessário
  alarm_description   = "Alarme para duração alta da Lambda reclamacao_lambda"
  dimensions = {
    FunctionName = var.lambda_function_name
  }
  alarm_actions = [var.sns_topic_arn]
}
