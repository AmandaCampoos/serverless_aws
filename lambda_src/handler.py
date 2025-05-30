import json
import boto3
import uuid
from datetime import datetime
from sentiment_analysis import detectar_sentimento  # <<< importando a lógica separada
from classification_analysis import classificar_tipo_reclamacao

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('reclamacoes')

def lambda_handler(event, context):
    print("Evento recebido:", event)

    try:
        body = json.loads(event.get('body', '{}'))
        mensagem = body.get('mensagem', '')

        # Usa a função modularizada
        sentimento_detectado = detectar_sentimento(mensagem)

        item = {
            'id': str(uuid.uuid4()),
            'nome': body.get('nome'),
            'email': body.get('email'),
            'mensagem': mensagem,
            'data_envio': datetime.utcnow().isoformat(),
            'sentimento': sentimento_detectado
        }

        response = table.put_item(Item=item)
        print("Resposta do DynamoDB:", response)

        return {
            'statusCode': 200,
            'body': json.dumps({'mensagem': 'Reclamação registrada com sucesso!'})
        }

    except Exception as e:
        print("Erro ao processar a requisição:", str(e))
        return {
            'statusCode': 500,
            'body': json.dumps({'erro': str(e)})
        }
