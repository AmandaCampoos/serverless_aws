resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.reclamacoes_topic.arn
  protocol  = "email"
  endpoint  = "amandacamposx2@gmail.com"
}

