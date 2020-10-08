# QC API (Docker)

## Desafio
Você vai ser responsável por modelar e desenvolver esse serviço utilizando as bibliotecas/frameworks que achar que mais convenientes para a solução. Tenha em mente de que temos mais de 300 mil clientes diários então escala é algo imprescindível por aqui. Para isso você deve ler os arquivos json neste repositório e baseado nos dados contidos criar os seguintes modelos de busca:

Disciplinas com questões mais quentes: Listar as disciplinas onde as questões foram as mais acessadas nas ultimas 24H
Mais acessadas por periodo: Listar as questões mais acessadas por semana/mês/ano

## Dependencies:
* **Ruby**: 2.7.1
* **Rails**: 6.0.3.3
* **Docker**:19.03.13
* **docker-composer**:1.25.5

## Project setup with docker:

1. Install the dependencies above
2. Clone this project: `$ git clone git@github.com:gabrielthleal/qc-api.git`
3. Go into the project folder: `$ cd qc-api`
4. You'll need to `checkout` to another branch: `$ git checkout qc-api-with-docker`
4. Build the containers: `$ docker-compose build`
5. Boot the containers: `$ docker-compose up`
6. In another terminal setup the database: `$ docker-compose run api rake db:create db:migrate`
7. Populate questions: `$ docker-compose run api rake populate:questions`
8. Populate question_access (Go, get some coffee, this will take some time): `$ docker-compose run api rake populate:question_access`

## Documentaion 
1. To generate the documentation run: `$ docker-compose run api rake docs:generate`
2. boot the app: `$ docker-compose up`
2. You can check this doc out on: http://localhost:3000/api/docs

## Tests
To run them just type: `$ docker-compose run api bundle exec rspec`

