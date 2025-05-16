#   Análise de Reclamações com AWS e Terraform

Este repositório contém a infraestrutura como código (IaC) de um sistema serverless desenvolvido com **AWS** e **Terraform**, com o objetivo de processar e analisar reclamações de forma automatizada.

##  Objetivo

O projeto visa automatizar o processamento de reclamações enviadas via API. Cada reclamação será analisada por uma função **AWS Lambda**, que poderá:

- Armazenar a reclamação em uma tabela do **DynamoDB**;
- Analisar sentimento usando **Amazon Comprehend** ou **Bedrock**;
- Publicar alertas via **SNS** (em casos críticos ou ofensivos);
- Integrar com **Step Functions** para orquestrar o fluxo;
- Registrar logs com **CloudWatch Logs**;
- Ser acessado por meio de uma API REST com **API Gateway**.

Tudo isso será gerenciado com **Terraform**, garantindo reprodutibilidade, controle de versão e automação da infraestrutura.

---

##  Estrutura do Projeto(em construção)

projeto-serverless/
├── lambda_src/
│   ├── handler.py
│   └── lambda.zip
├── terraform/
│   ├── apigateway/
│   ├── cloudwatch/
│   ├── dynamodb/
│   ├── iam/
│   │   ├── lambda_role.tf
│   │   └── outputs.tf
│   ├── lambda/
│   │   ├── lambda.tf
│   │   └── variables.tf
│   ├── stepfunctions/
├── venv/
├── .gitignore
├── main.tf
├── outputs.tf
├── variables.tf
├── zip_lambda.sh
└── README.md


---

##  Funcionalidades Já Implementadas

- [x] Estrutura modular com Terraform
- [x] Criação de role e política IAM para Lambda
- [x] Script de empacotamento da Lambda (`zip_lambda.sh`)
- [x] Backend remoto com **S3** e **DynamoDB** (state lock)

---

## 🚧 Em Construção

- Integração com API Gateway
- Criação da Lambda com lógica de análise de reclamação
- Configuração do DynamoDB (tabela de reclamações)
- Orquestração com Step Functions
- Notificações com SNS
- Uso de modelos de IA com Bedrock ou Comprehend

---

##  Desenvolvedora

| ![Amanda ](./foto.jpg) |  
|:--:|  
| **Amanda Ximenes**<br>Desenvolvedora jr |

📧 **Email:** amandacamposx2@gmail.com.com  
🔗 **LinkedIn:** [linkedin.com/in/amandaximenes](https://www.linkedin.com/in/amanda-ximenes-a02ab8266/)  

---

> Projeto acadêmico com fins de aprendizado e portfólio. Infraestrutura provisionada com Terraform, código organizado em módulos e boas práticas de automação.



