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

## Desenvolvimento

Para testar, a melhor opção é usar o Docker.

Primeiro, clone este repositório.

Crie um arquivo `.env` na raiz do projeto, com este conteúdo:

```
DATABASE_USER=postgres
POSTGRES_PASSWORD=shark
DATABASE_HOST=db
DATABASE_PORT=5432
RAILS_ENV=development
```

Agora rode os comenaods:

```
cd desafio-dev
docker-compose build -d
docker compose exec rake db:setup
docker-compose up
```

Acesse a aplicação em http://localhost:3000/

## Login

Usuário padrão:

- E-mail: 
```
admin@app.net
```
- Senha:
```
123456
```


