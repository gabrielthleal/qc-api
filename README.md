# QC API

## Desafio
Você vai ser responsável por modelar e desenvolver esse serviço utilizando as bibliotecas/frameworks que achar que mais convenientes para a solução. Tenha em mente de que temos mais de 300 mil clientes diários então escala é algo imprescindível por aqui. Para isso você deve ler os arquivos json neste repositório e baseado nos dados contidos criar os seguintes modelos de busca:

Disciplinas com questões mais quentes: Listar as disciplinas onde as questões foram as mais acessadas nas ultimas 24H
Mais acessadas por periodo: Listar as questões mais acessadas por semana/mês/ano


## How do I use this API?
  All endpoints are documented. You'll setup the project below in any way you choose, then generate the documentation.
  You can access it from your browser: http://localhost:3000/api/docs.
  After that you can test the endpoints with any tool to test APIs REST you want.

## Versions:
* **Ruby**: 2.7.1
* **Rails**: 6.0.3.3
* **PostgreSQL**: 10.14

if you choose the setup with docker 

* **Docker**: 19.03.13
* **docker-compose**: 1.25.5

## Project setup:

1. Install the dependencies above
2. Clone this project: `$ git clone git@github.com:gabrielthleal/qc-api.git`
3. Go into the project folder: `$ cd qc-api`
4. Setup database: `$ bin/rails db:create && bin/rails db:migrate`
5. Populate questions: `$ bin/rake populate:questions`
6. Populate question_access (will take some time): `$ bin/rake populate:question_access`

## Project setup with docker
steps 1, 2 and 3 from above.

4. Build the containers: `$ docker-compose build`
5. Boot the containers: `$ docker-compose up`
6. In another terminal setup the database: `$ docker-compose run api rake db:create db:migrate`
7. Populate questions: `$ docker-compose run api rake populate:questions`
8. Populate question_access (will take some time): `$ docker-compose run api rake populate:question_access`

## Documentaion
1. To generate the documentation run: `$ rake docs:generate`
2. Boot a server: `$ bin/rails server`
3. You can check this doc out on: http://localhost:3000/api/docs

## Documentaion (docker)
1. To generate the documentation run: `$ docker-compose run api rake docs:generate`
2. Boot a server: `$ docker-compose run api bin/rails server`
3. You can check this doc out on: http://localhost:3000/api/docs

## Tests
To run them just type: `$ bundle exec rspec`

## Tests (docker)
To run them just type: `$ docker-compose run api bundle exec rspec`

