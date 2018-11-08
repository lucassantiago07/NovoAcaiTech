DROP DATABASE lojadegames; 

CREATE DATABASE lojadegames;

use lojadegames; 

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
VALUES      ('Tomb Raider 2', 
             1, 
             'PS4', 
             'Brasil Games', 
             'Jogo Legal', 
             125, 
             180, 
             2015, 
             54, 
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