DROP DATABASE lojadegames; 

CREATE DATABASE lojadegames; 

CREATE TABLE lojadegames.produto 
  ( 
     id             BIGINT NOT NULL auto_increment, 
     nome           VARCHAR(100) NOT NULL, 
     categoria      VARCHAR(100) NULL, 
     plataforma     VARCHAR(100)  NULL, 
     fornecedor     VARCHAR(100)  NULL, 
     descricao      VARCHAR(1000) NULL, 
     preco_compra   DECIMAL DEFAULT 0,  
     preco_venda    DECIMAL DEFAULT 0,  
     ano_lancamento INT  NULL, 
     estoque     INT DEFAULT 0, 
     dt_cadastro    TIMESTAMP NULL, 
     CONSTRAINT pk_produto PRIMARY KEY (id) 
  ); 