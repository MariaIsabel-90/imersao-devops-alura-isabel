# Etapa 1: Imagem base
# Usamos uma imagem oficial e leve do Python, conforme especificado no readme.md.
FROM python:3.10-slim

# Etapa 2: Diretório de trabalho
# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# Etapa 3: Instalação de dependências
# Copia primeiro o requirements.txt para aproveitar o cache do Docker.
# A instalação só será executada novamente se este arquivo mudar.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 4: Copiar o código da aplicação
COPY . .

# Etapa 5: Expor a porta
EXPOSE 8000

# Etapa 6: Comando de execução
# Inicia o servidor Uvicorn, tornando-o acessível externamente.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]