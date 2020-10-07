# QC API

## Desafio
Você vai ser responsável por modelar e desenvolver esse serviço utilizando as bibliotecas/frameworks que achar que mais convenientes para a solução. Tenha em mente de que temos mais de 300 mil clientes diários então escala é algo imprescindível por aqui. Para isso você deve ler os arquivos json neste repositório e baseado nos dados contidos criar os seguintes modelos de busca:

Disciplinas com questões mais quentes: Listar as disciplinas onde as questões foram as mais acessadas nas ultimas 24H
Mais acessadas por periodo: Listar as questões mais acessadas por semana/mês/ano

## Why an API?
So, I've decided to work with a API project because in this way is possible to integrate with any front framework.
I was capable to keep all my atention to the back-end development to improve its performance.

## Versions:
* **Ruby**: 2.7.1
* **Rails**: 6.0.3.3
* **PostgreSQL**: 10.14

## Project setup:

1. Install the dependencies above
2. Clone this project: `$ git clone git@github.com:gabrielthleal/qc-api.git`
3. Go into the project folder: `$ cd qc-api`
4. Setup database: `$ bin/rails db:create && bin/rails db:migrate`
5. Populate questions: `$ bin/rake populate:questions`
6. Populate question_access (will take a some time): `$ bin/rake populate:question_access`

## Documentaion
 The API ducumentations is generated automaticaly when run the specs, you can check this doc out on: http://localhost:3000/api/docs

## Tests
To run them just type: `$ bundle exec rspec`
To generate the api documentation `$ rake docs:generate`

