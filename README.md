# Desafio programação - CNAB

"O teste consiste em parsear [este arquivo de texto(CNAB)](https://github.com/ByCodersTec/desafio-ruby-on-rails/blob/master/CNAB.txt) e salvar suas informações(transações financeiras) em uma base de dados a critério do candidato."

## Descrição do projeto

Esta aplicação web aceita o upload de arquivos CNAB para serem parseados, salvando os dados em um banco de dados relacional e exibindo-os em tabelas, ação permitida após a autorização do usuário ou via API.

## Principais ferramentas
- Ruby (v3.1.0)
- Rails (v7.0.1)
- Devise (v4.8.1)
- PostgreSQL
- GitHub Actions

## Subir o projeto

Para testar, a melhor opção é usar o Docker. Pra isso, é necessário ter instalado na máquina o docker e docker compose.

Clonado repositório, localmente, crie um arquivo `.env` na raiz do projeto, com este conteúdo:

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

Caso esteja no VSCode, instale a extensão Thunder Client e clique no botão New Request, ou Nova requisição.

- Selecione o método **POST** e preencha a url com **`http://localhost:3000/api/v1/parse_cnab`**

  ![image](https://user-images.githubusercontent.com/74281572/196061726-e10da8e3-8d86-481f-ad06-7fcf14f98bb1.png)

- Adicione o arquivo [CNAB.txt](https://github.com/ByCodersTec/desafio-ruby-on-rails/blob/master/CNAB.txt) para o campo `file`.

  ![1](https://user-images.githubusercontent.com/74281572/196061737-cacdc40a-0547-4749-aa52-b9786a3d4101.PNG)

- Clique em **SEND**.

- A resposta deve ser os dados do arquivo, interpretados:

  ![image](https://user-images.githubusercontent.com/74281572/196061795-1cd4d23b-e481-45c9-b0ca-1be6712cd7c9.png)
