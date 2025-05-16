resource "aws_sfn_state_machine" "reclamacao_state_machine" {
  name     = "state_machine_reclamacao"
  role_arn = var.step_function_role_arn

  definition = jsonencode({
    Comment = "Fluxo para processar reclamação"
    StartAt = "ProcessaReclamacao"
    States = {
      ProcessaReclamacao = {
        Type     = "Task"
        Resource = var.lambda_arn
        End      = true
      }
    }
  })

  type = "STANDARD"
}
