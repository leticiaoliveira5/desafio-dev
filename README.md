# Desafio programação - CNAB

"O teste consiste em parsear [este arquivo de texto(CNAB)](https://github.com/ByCodersTec/desafio-ruby-on-rails/blob/master/CNAB.txt) e salvar suas informações(transações financeiras) em uma base de dados a critério do candidato."

## Descrição do projeto

Esta aplicação web aceita o upload de um arquio CNAB para ser parseado, salvando seus dados em um banco de dados relacional e exibindo-os em tabelas, ação permitida somente após a autorização do usuário.

## Principais ferramentas
- Ruby (v3.1.0)
- Rails (v7.0.1)
- Devise (v4.8.1)
- PostgreSQL
- GitHub Actions

## Subir o projeto

Para testar, a melhor opção é usar o Docker. Pra isso, é necessário ter instalado na máquina o docker e docker compose.

Primeiro, clone este repositório.

Crie um arquivo `.env` na raiz do projeto, com este conteúdo:
(isso será importante para a criação e conexão com o banco de dados postgres)

```
DATABASE_USER=postgres
POSTGRES_PASSWORD=shark
DATABASE_HOST=db
DATABASE_PORT=5432
```

Agora execute os comandos no terminal:

```
cd desafio-dev
docker-compose build
docker-compose up
```

Abra um outro terminal execute:

```
cd desafio-dev
docker compose exec rake db:setup
```

Acesse a aplicação em http://localhost:3000/

## Login

Para utilizar o app, é preciso fazer login. É possível entrar com o usuário criado no `seed` ou criar um novo clicando em Sign Up.

Usuário padrão:

- E-mail: 
```
admin@app.net
```
- Senha:
```
123456
```
## Consumir o endpoint da API

Para consumir o endpoint da API, somente é necessário que a aplicação esteja rodando.

Caso esteja no VSCode, baixe a extensão Thunder Cliente e clique no botão New Request, ou Nova requisição.

Selecione o método **POST** e preencha a url com **`http://localhost:3000/api/v1/parse_cnab`**

Adicione o arquivo `CNAB.txt` para o campo `file`.

Clique em **SEND**.