terraform {
  required_version = ">= 1.5.0"
  backend "s3" {
    bucket         = "teste-1-amanda"
    key            = "terraform/serverless/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Módulos de infraestrutura
module "iam" {
  source             = "./terraform/iam"
  lambda_policy_name = "lambda_policy_reclamacao"
  lambda_role_name   = "lambda_exec_role_reclamacao"
  lambda_arn         = module.lambda.lambda_arn
}



module "lambda" {
  source = "./terraform/lambda"
  lambda_role_arn  = module.iam.lambda_role_arn
}

module "apigateway" {
  source = "./terraform/apigateway"
}

module "dynamodb" {
  source = "./terraform/dynamodb"
}

module "stepfunctions" {
  source                = "./terraform/stepfunctions"
  lambda_arn            = module.lambda.lambda_arn
  step_function_role_arn = module.iam.step_function_role_arn
}



module "cloudwatch" {
  source = "./terraform/cloudwatch"
}
