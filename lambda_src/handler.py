import json
import boto3
import uuid
from datetime import datetime
from sentiment_analysis import detectar_sentimento
from classification_analysis import classificar_tipo_reclamacao

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('reclamacoes')

def lambda_handler(event, context):
    print("Evento recebido:", event)

    try:
        if 'body' in event:
            body = json.loads(event['body'])  # API Gateway
        else:
            body = event  # Execução direta/testes

        mensagem = body.get('mensagem', '').strip()

        if not mensagem:
            print("Mensagem vazia. Pulando análises.")
            sentimento_detectado = "INDETERMINADO"
            tipo_classificacao = "INDETERMINADO"
        else:
            sentimento_detectado = detectar_sentimento(mensagem)
            tipo_classificacao = classificar_tipo_reclamacao(mensagem)

        item = {
            'id': str(uuid.uuid4()),
            'nome': body.get('nome'),
            'email': body.get('email'),
            'mensagem': mensagem,
            'data_envio': datetime.utcnow().isoformat(),
            'sentimento': sentimento_detectado,
            'categoria': tipo_classificacao
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
