import json
import boto3
import uuid
from datetime import datetime

# Inicializa os recursos do DynamoDB e SNS
dynamodb = boto3.resource('dynamodb')
sns = boto3.client('sns')

table = dynamodb.Table('reclamacoes')

# Substitua pelo ARN real do seu tópico SNS
SNS_TOPIC_ARN = "arn:aws:sns:us-east-1:746669239591:topico-reclamacoes"

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

        # Envia notificação SNS
        sns_response = sns.publish(
            TopicArn=SNS_TOPIC_ARN,
            Subject="📬 Nova Reclamação Recebida",
            Message=f"Nome: {item['nome']}\nEmail: {item['email']}\nMensagem: {item['mensagem']}\nData: {item['data_envio']}"
        )
        print("Resposta do SNS:", sns_response)

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
