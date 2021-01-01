## Stack

* `ruby 2.6.6`
* `rails 5.2.4`
* `postgres`

## Sobre


A Zygo Livraria tem como objetivo apresentar boas praticas no desenvolvimento usando Ruby on Rails (RoR) em seu core.

Neste sistemas temos duas áreas que se comunicam: `admins` que podem cadastrar seu livros especificando os Autores, Título e Descrição sobre o Livro, e `usuários` que não possuem autenticação mas possuem o direito de acessar os livros cadastrados pelos admins.

## Dependências

* Para o fluxo de authenticação foi usado a gem `devise`, que considero com estável;

* Para colocar a descrição de texto optei em colocar um editor wysiwyg, oque se encaixou em praticidade foi `trix`(que por sinal foi desenvolvido pela equipe desenvolvedora do rails - Basecamp);

* Para controle de plugins js estamos utilizando `yarn` juntamente com `webpacker`;

* Para banco de dados estamos utilizando `Postgres`;


## Rodando o projeto:


* Primeiro clone o projeto usando ssh:

```bash
git clone git@github.com:BrunoNeville31/zygo_avaliacao.git
```

* Entre na pasta `zygo_avaliacao`

```bash
cd zygo_avaliacao
```

* Antes de buildar o projeto, confirme se no arquivo `.env` possui os dados do banco de dados.. caso não possua favor me comunicar


* Faça um build dos containers(O build é preciso no docker apenas quando o arquivo `Dockerfile` sofre alguma alteração, mas na primeira vez é preciso buildar a imagem):

```bash
docker-compose build
```

* Na primeira vez que for buildar a imagem do projeto, ele vai precisar instalar as gems, esse procedimento você fará apenas na primeira vez que for buildar o projeto, ou quando reclamar que falta alguma gem nova que foi adicionada por outro sujeito.

```bash
docker-compose run web bundle
```

* Após buildar o projeto, suba os containers(sempre bom derrubar os que estão rodando antes de iniciar outros, você pode acabar rodando várias instâncias juntas sem preceber):

```bash
docker-compose down && docker-compose up
```

* Agora como ultima etapa coloque estas 3 linhas de comando para criarmos o banco e criarmos o acesso para Admin:

```bash
# cria o banco
docker-compose exec web rails db:create

# roda as migrations
docker-compose exec web rails db:migrate

# Cria o Admin 
docker-compose exec web rails db:seed

# Finalmente acesse o container pronto para ser usado:

docker-compose exec web bash
```

## Acessando o Projeto

Abra seu navegador e acesse `https://localhost` e você ja estará na livraria na tela de usuário. Ao clicar no link de Acesso do Admnistrador você poderá se logar no sistema. A senha de acesso é `zygo@admin` e senha `Zygo@2021`; Fica a vontade para cadastrar seus livros

## Branches

Atualmente mergeamos tudo na master(Sei que não é uma boa prática) - Mas por se tratar de um projeto de avaliação eu amarrei cada merge a uma tag para termos um controle melhor.. para acompanhar o fluxo dê uma uma olhada no arquivo `CHANGELOG.md`;

## Testes

Usamos basicamente o rspec.
