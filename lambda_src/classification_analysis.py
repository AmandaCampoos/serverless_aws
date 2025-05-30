def classificar_tipo_reclamacao(mensagem):
    """
    Função placeholder para classificar o tipo da reclamação.
    No futuro, podemos trocar por Amazon Comprehend Custom ou Bedrock.
    """
    mensagem_lower = mensagem.lower()

    if "dinheiro" in mensagem_lower or "fatura" in mensagem_lower:
        return "Financeiro"
    elif "mal atendimento" in mensagem_lower or "funcionário" in mensagem_lower:
        return "Atendimento"
    elif "produto" in mensagem_lower or "defeito" in mensagem_lower:
        return "Produto"
    elif "entrega" in mensagem_lower or "atraso" in mensagem_lower:
        return "Entrega"
    else:
        return "Outro"
