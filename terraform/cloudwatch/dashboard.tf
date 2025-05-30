resource "aws_cloudwatch_dashboard" "lambda_dashboard" {
  dashboard_name = "dashboard-reclamacoes"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width  = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/Lambda", "Invocations", "FunctionName", var.lambda_function_name ],
            [ ".", "Errors", ".", "." ]
          ],
          period = 300,
          stat   = "Sum",
          region = var.region,
          title  = "Invocações e Erros - Lambda Reclamações"
        }
      },
      {
        type = "metric",
        x    = 12,
        y    = 0,
        width  = 12,
        height = 6,
        properties = {
          metrics = [
            [ "AWS/Lambda", "Duration", "FunctionName", var.lambda_function_name ]
          ],
          period = 300,
          stat   = "Average",
          region = var.region,
          title  = "Duração Média da Lambda"
        }
      }
    ]
  })
}
