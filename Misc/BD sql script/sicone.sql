create database sicone;
use sicone;

-- drop database sicone;

CREATE TABLE ADMIN (
  ID VARCHAR(10) NOT NULL,
  NOME VARCHAR(40),
  SENHA VARCHAR(20),
  PRIMARY KEY (ID)
);

insert into ADMIN (ID, NOME, SENHA) values ('admin', 'Churumelo', 'admin');

CREATE TABLE FUNCIONARIO (
  ID INT NOT NULL AUTO_INCREMENT,
  NOME VARCHAR(40),
  CPF CHAR(14),
  SENHA VARCHAR(20),
  PRIMARY KEY (ID)
);

select * from produto;

CREATE TABLE CLIENTE (
  CPF CHAR(14) NOT NULL,
  NOME VARCHAR(40),
  PRIMARY KEY (CPF)
);

CREATE TABLE FORNECEDOR (
  CNPJ CHAR(18) NOT NULL,
  NOME VARCHAR(40),
  PRIMARY KEY (CNPJ)
);

drop table PRODUTO;
insert into fornecedor (cnpj, nome) values ('1111111111', 'qdas');
select * from fornecedor;

CREATE TABLE PRODUTO (
  CODPROD INT AUTO_INCREMENT,
  NOMEPROD VARCHAR(50),
  QTDPROD INT,
  DESCRPROD VARCHAR(200),
  FK_FORNCNPJ CHAR(18),
  PRIMARY KEY (CODPROD)
 -- FOREIGN KEY (FK_FORNCNPJ) REFERENCES FORNECEDOR(CNPJ)
);

insert into produto(nomeprod,qtdprod,descrprod) values('banissopa luara', 90, 'mirossola bafinho');
drop table produto;
select * from produto;

CREATE TABLE PEDIDO (
  NUMPEDIDO INT,
  DATAPEDIDO DATE,
  PRIMARY KEY (NUMPEDIDO)
);

CREATE TABLE ITEMPEDIDO (
  CODPROD INT,
  NOMEPROD VARCHAR(20),
  QTDPROD INT,
  PRIMARY KEY (CODPROD)
);


