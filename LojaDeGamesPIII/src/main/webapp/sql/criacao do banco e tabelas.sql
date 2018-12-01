DROP DATABASE lojadegames; 

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
VALUES      ('Tomb Raider II', 
             1, 
             'PS1', 
             'Tomb Raider USA', 
             'É o segundo jogo de computador e videogames da série Tomb Raider. Foi desenvolvido pela Core Design e publicado pela Eidos Interactive, e originalmente lançado para PC e Playstation em 1997', 
             30, 
             58, 
             1997, 
             3, 
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
VALUES      ('Need for Speed: Most Wanted', 
             2, 
             'XBOX', 
             'Electronic Arts', 
             'É um jogo eletrônico de corrida desenvolvido pela Criterion Games e publicado pela Electronic Arts.', 
             250, 
             365, 
             2012, 
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
VALUES      ('Midnight Club', 
             2, 
             'XBOX', 
             'Electronic Arts', 
             'É um jogo de corrida desenvolvido pela Rockstar San Diego no ano de 2003 e publicado pela Rockstar Games. O jogo é semelhante ao Midtown Madness feito pela Angel Studios, com foco de corridas no mundo urbano aberto.', 
             97, 
             154, 
             2009, 
             2, 
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
VALUES      ('Grand Theft Auto: San Andreas', 
             5, 
             'PS2', 
             'Michael Hunter Games', 
             'é um jogo eletrônico de ação-aventura desenvolvido pela Rockstar North e publicado pela Rockstar Games.', 
             24, 
             61, 
             2004, 
             9, 
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
VALUES      ('Call of Duty 3', 
             3, 
             'PS2', 
             'Joel Goldsmith Games', 
             'É o terceiro título da série Call of Duty, desenvolvido pela Treyarch, disponível para Xbox 360, PlayStation 2, PlayStation 3, PlayStation Portable, Xbox e Nintendo Wii.', 
             80, 
             129, 
             2006, 
             12, 
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
VALUES      ('Counter-Strike: Global Offensive', 
             3, 
             'PC', 
             'Brasil Games', 
             'É um jogo online desenvolvido pela Valve Corporation e pela Hidden Path Entertainment, sendo uma sequência de Counter-Strike: Source. É o quarto título principal da franquia.', 
             21, 
             40, 
             2012, 
             42, 
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
VALUES      ('World of Warcraft', 
             4, 
             'PC', 
             'Warcraft Games STR', 
             'É um jogo on-line, da produtora Blizzard lançado em 2004. O jogo se passa no mundo fantástico de Azeroth, introduzido no primeiro jogo da série, Warcraft: Orcs & Humans em 1994.',
             70, 
             134, 
             2004, 
             32, 
             NULL);

CREATE TABLE lojadegames.cliente 
  ( 
     id       BIGINT NOT NULL auto_increment, 
     nome     VARCHAR(100) NOT NULL, 
     cpf      VARCHAR(100) NOT NULL, 
     email    VARCHAR(100) NULL, 
     endereco VARCHAR(100) NULL, 
     cep      INT NULL, 
     telefone VARCHAR(100) NULL, 
     celular  VARCHAR(100) NULL, 
     CONSTRAINT pk_tbcliente PRIMARY KEY(id) 
  ); 

INSERT INTO `cliente` 
            (`nome`, 
             `cpf`, 
             `email`, 
             `endereco`, 
             `cep`, 
             `telefone`, 
             `celular`) 
VALUES      ('Benevenuto Daciolo Fonseca dos Santos', 
             '42888041832', 
             'daciolo@gmail.com', 
             'Rua Hugo DAntola, 95 - Lapa de Baixo - São Paulo', 
             05762221, 
             '1158621242', 
             '11964549502'); 

CREATE TABLE lojadegames.funcionario 
  ( 
     id       BIGINT NOT NULL auto_increment, 
     nome     VARCHAR(100) NOT NULL, 
     cpf      VARCHAR(100) NULL, 
     filial   INT NOT NULL, 
     cargo    VARCHAR(100) NULL, 
     endereco VARCHAR(100) NULL, 
     cep      VARCHAR(100) NULL, 
     telefone INT NULL, 
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
VALUES      ('SANTOS LIMA', 
             '42888041832', 
             1, 
             'Desenvolvedor', 
             'Av. Paulista 100 - São Paulo', 
             05762220, 
             '1156235423', 
             '11964549507', 
             'santos', 
             '123'); 

CREATE TABLE lojadegames.venda 
  ( 
     id               BIGINT NOT NULL auto_increment, 
     id_cliente       INT NOT NULL, 
     data_da_venda    TIMESTAMP NULL, 
     subtotal      VARCHAR(100) NOT NULL, 
     valortotal       VARCHAR(100) NOT NULL, 
     desconto       VARCHAR(100) NOT NULL, 
     filial   VARCHAR(100) NOT NULL,
     CONSTRAINT pk_tbvenda PRIMARY KEY(id) 
  ); 

CREATE TABLE lojadegames.produtos_da_venda 
  ( 
     id             BIGINT NOT NULL auto_increment, 
     nome_produto   VARCHAR(100) NOT NULL, 
     quantidade     INT NOT NULL, 
     id_venda INT NOT NULL, 
     preco_unitario VARCHAR(100) NULL,
     CONSTRAINT pk_tbprodutosdavenda PRIMARY KEY(id) 
  ); 