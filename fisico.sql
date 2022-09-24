create database ecommerce;
use ecommerce;

create table cliente(
idCliente int auto_increment primary key,
FirstNome varchar(12),
Sobrenome varchar(45),
Endereco varchar(45),
CPF char(11) not null,
Cartao varchar(45),
PIX varchar(45),
constraint unique_cpf_client unique(cpf)
);

create table produto(
idProduto int auto_increment primary key,
Categoria enum("Eletrônico","Vestuário","Brinquedo","Alimentos","Móveis") not null,
Classificação_criança bool default false,
Avaliação float default 0,
Size varchar(10),
constraint unique_cpf_client unique(cpf)
);

create table ordem(
idOrdem int auto_increment primary key,
idOrdemCliente int,
OrdemStatus enum("Cancelado","Confirmado","Em processamento")default "Em processamento",
ordemDescrição varchar(255),
frete float default 10,
entrega date,
códigoRastreio varchar (12),
PagamentoBoleto bool default false,
constraint fk_ordem_cliente foreign key(idOrdemCliente) references cliente(idCliente)

);

create table pagamentos(
idCliente int,
idPagamento int,
TipoPagamento enum("Boleto","Cartão de crédito"," Dois cartões de créditos", "Pix"),
boleto float, 
cartao float,
Pix float, 
LimiteAvaliado float,
validadeCartao date,
primary key(idCliente, id_Pagamento),
constraint fk_pagamento_cliente foreign key(idPagamento) references cliente(idCliente)
);

create table estoque(
idEstoque int auto_increment primary key,
localEstoque varchar(255),
QuantidadeEstoque int default 0
);

create table fornecedor(
idFornecedor int auto_increment primary key,
razaoSocial varchar(255) not null,
CNPJ char(14) not null,
contato varchar(11) default null,
constraint unique_fornecedor unique (CNPJ)
);

create table vendedor(
idVendedor int auto_increment primary key,
razaoSocial varchar(255) not null,
endereco varchar (30) not null,
nomeFantasia varchar (30),
CNPJ char(14) not null,
cpf char(11),
contato varchar(11) default null,
constraint unique_cnpj_vendedor unique (CNPJ),
constraint unique_cpf_vendedor unique (CPF)
);

create table produtoEstoque(
idProdutoEstoque int auto_increment primary key,
razaoSocial varchar(255) not null,
endereco varchar (30) not null,
nomeFantasia varchar (30),
CNPJ char(14) not null,
cpf char(11),
contato varchar(11) default null,
constraint unique_cnpj_vendedor unique (CNPJ),
constraint unique_cpf_vendedor unique (CPF)

);


