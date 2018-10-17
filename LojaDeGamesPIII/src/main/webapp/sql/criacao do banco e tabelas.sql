DROP DATABASE lojadegames; 

CREATE DATABASE lojadegames; 

CREATE TABLE lojadegames.produto 
  ( 
     id             BIGINT NOT NULL auto_increment, 
     nome           VARCHAR(100) NOT NULL, 
     categoria      VARCHAR(100) NOT NULL, 
     plataforma     VARCHAR(100) NOT NULL, 
     fornecedor     VARCHAR(100) NOT NULL, 
     descricao      VARCHAR(1000) NULL, 
     preco_compra   DECIMAL(9, 2) NOT NULL, 
     preco_venda    DECIMAL(9, 2) NOT NULL, 
     ano_lancamento INT NOT NULL, 
     quantidade     INT NOT NULL DEFAULT 0, 
     dt_cadastro    TIMESTAMP NOT NULL, 
     CONSTRAINT pk_produto PRIMARY KEY (id) 
  ); 