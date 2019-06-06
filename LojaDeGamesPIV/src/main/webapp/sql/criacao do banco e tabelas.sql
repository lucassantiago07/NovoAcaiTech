


CREATE DATABASE lojadegames; 

USE lojadegames; 

CREATE TABLE lojadegames.produto 
  ( 
     id             BIGINT NOT NULL auto_increment, 
     nome           VARCHAR(255) NOT NULL, 
     categoria      VARCHAR(255) NULL, 
     plataforma     VARCHAR(255) NULL, 
     fornecedor     VARCHAR(255) NULL, 
     descricao      VARCHAR(255) NULL, 
     preco_compra   INT DEFAULT 0, 
     preco_venda    INT DEFAULT 0, 
     ano_lancamento INT DEFAULT 0, 
     estoque        INT DEFAULT 0, 
     dt_cadastro    TIMESTAMP NULL, 
     CONSTRAINT pk_tbproduto PRIMARY KEY (id) 
  ); 

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Grand Theft Auto V', 
             1, 
             'PS4', 
             'Rockstar North', 
'GTA 5 é um jogo de mundo aberto.'
             , 
50, 
100, 
2013, 
10, 
NULL); 

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('FIFA 19', 
             2, 
             'PS4', 
             'Electronic Arts', 
'FIFA 19 é um simulador de futebol.'
             , 
100, 
150, 
2018, 
10, 
NULL); 


INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Console Playstation 4 Slim', 
             5, 
             'PS4', 
             'Sony', 
'PS4 Slim com um controle' 
             , 
1500, 
1800, 
2013, 
15, 
NULL); 

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Spider-Man', 
             3, 
             'PS4', 
             'Insomniac Games', 
'Marvels Spider-Man é um jogo eletrônico de ação-aventura baseado no super-herói Homem-Aranha da Marvel Comics.', 
80, 
129, 
2018, 
20, 
NULL); 


INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Sekiro™: Shadows Die Twice', 
             4, 
             'PS4', 
             'FromSoftware', 
'Sekiro: Shadows Die Twice é um jogo eletrônico de ação-aventura desenvolvido pela FromSoftware e publicado pela Activision.'
             , 
70, 
150, 
2019, 
32, 
NULL); 

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Console Xbox One S', 
             6, 
             'Xbox', 
             'microsoft', 
'Nova geração de console da microsoft'
             , 
1000, 
1200, 
2013, 
32, 
NULL); 


INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Crash Bandicoot', 
             7, 
             'PS4', 
             'Activision', 
'Novo Crash', 
50, 
100, 
2016, 
22, 
NULL); 

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Red Dead Redemption 2 dragon ball fighterz', 
             8, 
             'PS4', 
             'EA', 
'Red Dead Redemption II é um jogo eletrônico de ação-aventura western desenvolvido pela Rockstar Studios e publicado pela Rockstar Games. ', 
75, 
150, 
2018, 
50, 
NULL);

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Dragon Ball Fighterz', 
             9, 
             'Xbox', 
             'Bandai Namco Entertainment ', 
'Dragon Ball FighterZ é um jogo da franquia Dragon Ball, desenvolvido pela Arc System Works é publicado pela Bandai Namco Entertainment para PlayStation 4, Xbox One e Microsoft Windows via Steam.', 
50, 
75, 
2017, 
10, 
NULL);  

INSERT INTO `produto` 
            (`nome`, 
             `categoria`, 
             `plataforma`, 
             `fornecedor`, 
             `descricao`, 
             `preco_compra`, 
             `preco_venda`, 
             `ano_lancamento`, 
             `estoque`, 
             `dt_cadastro`) 
VALUES      ('Forza Motorsport 7', 
             10, 
             'Xbox', 
             'Xbox', 
'Forza Motorsport 7 é um jogo de corrida desenvolvido pela Turn 10 Studios e publicado pela Microsoft Studios, servindo como o décimo jogo da franquia na série Forza, o sétimo na série principal', 
50, 
90, 
2018, 
15, 
NULL);


CREATE TABLE lojadegames.cliente 
  ( 
     id       BIGINT NOT NULL auto_increment, 
     nome     VARCHAR(100) NOT NULL, 
     cpf      VARCHAR(100) NOT NULL, 
     email    VARCHAR(100) NULL, 
     endereco VARCHAR(100) NULL, 
     cep      INT NULL, 
     numeroend varchar (20) NOT NULL,
     complemento VARCHAR (50),
     cidade varchar (15) NOT NULL,
     estado VARCHAR (02) NOT NULL,
     telefone VARCHAR(100) NULL, 
     celular  VARCHAR(100) NULL, 
     senha VARCHAR (25) NOT NULL,
     CONSTRAINT pk_tbcliente PRIMARY KEY(id) 
  ); 

             
 INSERT INTO `cliente` 
            (`nome`, 
             `cpf`, 
             `email`, 
             `endereco`, 
             `cep`, 
             `telefone`, 
             `celular`,
             `senha`,
             `cidade`,
             `estado`,
             `numeroend`) 
VALUES      ('teste', 
             '42888041832', 
             'a', 
             'Rua Hugo DAntola, 95 - Lapa de Baixo - São Paulo', 
             05762221, 
             '1158621242', 
             '11964549502',
             'b',
             'c',
             'd',
             'e');
             
              INSERT INTO `cliente` 
            (`nome`, 
             `cpf`, 
             `email`, 
             `endereco`, 
             `cep`, 
             `telefone`, 
             `celular`,
             `senha`,
             `cidade`,
             `estado`,
             `numeroend`) 
VALUES      ('admin', 
             '42888041853', 
             'santos', 
             'Rua Augusta', 
             05762255, 
             '1158621666', 
             '11964549566',
             'liquido',
             'gasoso',
             'rj',
             '69');
             

CREATE TABLE lojadegames.funcionario 
  ( 
     id       BIGINT NOT NULL auto_increment, 
     nome     VARCHAR(100) NOT NULL, 
     cpf      VARCHAR(100) NULL, 
     filial   VARCHAR(100) NULL, 
     cargo    VARCHAR(100) NULL, 
     endereco VARCHAR(100) NULL, 
     cep      VARCHAR(100) NULL, 
     telefone VARCHAR(100) NULL, 
     celular  VARCHAR(100) NULL, 
     usuario  VARCHAR(100) NULL, 
     senha    VARCHAR(100) NULL, 
     CONSTRAINT pk_tbfuncionario PRIMARY KEY(id) 
  ); 

INSERT INTO `funcionario` 
            (`nome`, 
             `cpf`, 
             `filial`, 
             `cargo`, 
             `endereco`, 
             `cep`, 
             `telefone`, 
             `celular`, 
             `usuario`, 
             `senha`) 
VALUES      ('Santos Gomes Da Silva', 
             '42888041832', 
             'São Paulo', 
             'Vendedor', 
             'Av. Paulista 100 - São Paulo', 
             05762220, 
             '1156235423', 
             '11964549507', 
             'santos', 
             '123'); 

CREATE TABLE lojadegames.venda 
  ( 
     id                BIGINT NOT NULL auto_increment, 
     bandeira          VARCHAR(100) NULL, 
     datadavenda       TIMESTAMP, 
     desconto          VARCHAR(100) NULL, 
     filial            VARCHAR(100) NULL, 
     idcliente         VARCHAR(100) NULL, 
     idvendedor        VARCHAR(100) NULL, 
     numerocomprovante VARCHAR(100) NULL, 
     subtotal          VARCHAR(100) NULL, 
     valortotal        VARCHAR(100) NULL, 
     valoremespecie    VARCHAR(100) NULL, 
     vezescartao       VARCHAR(100) NULL, 
     CONSTRAINT pk_tbvenda PRIMARY KEY(id) 
  ); 

CREATE TABLE lojadegames.produtos_da_venda 
  ( 
     id             BIGINT NOT NULL auto_increment, 
     nome_produto   VARCHAR(100) NULL, 
     quantidade     INT NULL, 
     id_venda       INT NULL, 
     preco_unitario VARCHAR(100) NULL, 
     CONSTRAINT pk_tbprodutosdavenda PRIMARY KEY(id) 
  ); 