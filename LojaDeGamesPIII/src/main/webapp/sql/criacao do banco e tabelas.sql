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
     CONSTRAINT pk_tbProduto PRIMARY KEY (id) 
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

create table lojadegames.cliente (
	id bigint not null auto_increment,
	nome varchar(100) not null,
	cpf varchar(100) not null,
	email varchar(100) null,
	endereco varchar(100) null,
	cep int  null,
	telefone varchar(100) null,
	celular varchar(100) null,
    constraint pk_tbCliente primary key(id)
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


create table lojadegames.funcionario (
	id bigint not null auto_increment,
	nome varchar(100) not null,
	cpf int not null,
        filial int not null,
	cargo varchar(100)  null,
	endereco varchar(100)  null,        
	cep int  null,
	telefone int  null,
	celular varchar(100)  null,
    constraint pk_tbFuncionario primary key(id)
);
