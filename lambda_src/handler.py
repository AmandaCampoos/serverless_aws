import json
import boto3
import uuid
from datetime import datetime

# Inicializa o recurso do DynamoDB
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('reclamacoes')

def lambda_handler(event, context):
    print("Evento recebido:", event)  # Log para CloudWatch

    try:
        # Tenta carregar o corpo da requisição
        body = json.loads(event.get('body', '{}'))

        # Monta o item a ser salvo no DynamoDB
        item = {
            'id': str(uuid.uuid4()),
            'nome': body.get('nome'),
            'email': body.get('email'),
            'mensagem': body.get('mensagem'),
            'data_envio': datetime.utcnow().isoformat()
        }

        # Salva no DynamoDB
        response = table.put_item(Item=item)
        print("Resposta do DynamoDB:", response)

        return {
            'statusCode': 200,
            'body': json.dumps({'mensagem': 'Reclamação registrada com sucesso!'})
        }

    except Exception as e:
        print("Erro ao processar a requisição:", str(e))  # Log para CloudWatch
        return {
            'statusCode': 500,
            'body': json.dumps({'erro': str(e)})
        }
