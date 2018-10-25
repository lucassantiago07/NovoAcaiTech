DROP DATABASE lojadegames; 

CREATE DATABASE lojadegames; 

CREATE TABLE lojadegames.produto 
  ( 
     id             BIGINT NOT NULL auto_increment, 
     nome           VARCHAR(255) NOT NULL, 
     categoria      VARCHAR(255) NULL, 
     plataforma     VARCHAR(255)  NULL, 
     fornecedor     VARCHAR(255)  NULL, 
     descricao      VARCHAR(255) NULL, 
     preco_compra   INT DEFAULT 0,  
     preco_venda    INT DEFAULT 0,  
     ano_lancamento INT DEFAULT 0,  
     estoque        INT DEFAULT 0, 
     dt_cadastro    TIMESTAMP NULL, 
     CONSTRAINT pk_produto PRIMARY KEY (id) 
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
             NULL) 