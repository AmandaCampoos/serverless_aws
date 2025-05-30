import boto3

comprehend = boto3.client('comprehend')

def detectar_sentimento(texto, idioma='pt'):
    try:
        resposta = comprehend.detect_sentiment(
            Text=texto,
            LanguageCode=idioma
        )
        return resposta['Sentiment']
    except Exception as e:
        print(f"Erro ao detectar sentimento: {e}")
        return "INDETERMINADO"
