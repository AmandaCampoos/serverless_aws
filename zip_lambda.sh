#!/bin/bash

# Caminho para a pasta onde está o código da Lambda
LAMBDA_DIR="./lambda_src"

# Nome do arquivo zip de saída
ZIP_FILE="lambda.zip"

echo "⏳ Gerando pacote $ZIP_FILE com os arquivos da Lambda..."

# Navega até a pasta da Lambda
cd "$LAMBDA_DIR" || exit

# Remove o zip antigo, se existir
rm -f $ZIP_FILE

# Cria novo zip com todos arquivos Python e dependências
zip -r $ZIP_FILE . -x "*.pyc" "__pycache__/*"

# Volta ao diretório original
cd - >/dev/null || exit

echo "✅ Pacote Lambda criado em: $LAMBDA_DIR/$ZIP_FILE"
