-- criação do banco de dados - ecommerce
CREATE DATABASE ecommerce2;
USE ecommerce2;

-- Um idCliente só deve está na tabela clientepf ou clientepj
CREATE TABLE cliente(
	idCliente int auto_increment primary key,
	contato varchar(11), 
    endereco varchar(255)
);

CREATE TABLE clientepf(
	cpf char(11),
	idCliente int,
	Fname varchar(45) not null,
    Minit varchar(45),
    Lname varchar(45),
	datanascimento date,
	constraint fk_clientepf_cliente foreign key (idCliente) references cliente (idCliente),
	constraint check_cpf unique(cpf),
	primary key (cpf, idCliente)
);


CREATE TABLE clientepj(
	cnpj char(15),
	idCliente int,
	razaosocial varchar(45),
	nomefantasia varchar(45),
	constraint fk_clientepj_cliente foreign key (idCliente) references cliente (idCliente),
	constraint check_cnpj unique(cnpj),
	primary key (cnpj, idCliente)
);


CREATE TABLE produto(
	idProduto int auto_increment primary key,
    Pname varchar(45) not null,
    categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') not null,
    valor float(10,2) not null,
    avaliacao float default 0,
    size varchar(10)
);


-- um pagamento pode ter varias formas de pagamento, table formapagamento
CREATE TABLE pagamento( 
    idPagamento int auto_increment primary key,
    datapagamento date not null,
    valor float not null,
    descricao varchar(255),
    idPedido int,
    constraint ck_valor_pagamento check (valor > 0),
    constraint fk_pagamento_pedido foreign key (idPedido) references pedido (idPedido)
 );


-- idFormaPagamento só pode está presente em uma das tabelas formapagamentoCartao, formapagamentoPix, formapagamentoBoleto
CREATE TABLE formapagamento(
	idFormaPagamento int auto_increment primary key,
	tipo enum('Boleto', 'Cartão', 'Pix') not null,
	descricao varchar(255),
	idPagamento int,
	idPedido int,
	constraint fk_formapg_pagamento foreign key (idPagamento) references pagamento (idPagamento),
	constraint fk_formapg_pgpedido foreign key (idPedido) references pagamento (idPedido) 
);


CREATE TABLE formapagamentoCartao(
	idFormaPagamentoCartao int auto_increment primary key,
	idFormaPagamento int,
	numero varchar(20) not null,
	nometitular varchar(45) not null,
	validade date not null,
	valor float not null,
	constraint fk_cartao_formapg foreign key (idFormaPagamento) references formapagamento (idFormaPagamento)
);

CREATE TABLE formapagamentoPix(
	idFormaPagamentoPix int auto_increment primary key,
	idFormaPagamento int,
	chave varchar(100) not null,
	tipochave varchar(45),
	valor float not null,
	constraint fk_pix_formapg foreign key (idFormaPagamento) references formapagamento (idFormaPagamento)
);


CREATE TABLE formapagamentoBoleto(
	idFormaPagamentoBoleto int auto_increment primary key,
	idFormaPagamento int,
	codigobarra varchar(100) not null,
	datavencimento date not null,
	valor float not null,
	constraint fk_boleto_formapg foreign key (idFormaPagamento) references formapagamento (idFormaPagamento)
);




CREATE TABLE pedido(
	idPedido int auto_increment primary key,
    idCliente int,
    status ENUM('Em Andamento', 'Processando', 'Enviado', 'Finalizado', 'Cancelado') default 'Processando',
    descricao varchar(255),
    frete float(10,2) not null,
    datapedido date not null,
    constraint fk_pedido_cliente foreign key (idCliente) references cliente (idCliente)
);


CREATE TABLE entrega(
	idEntrega int auto_increment primary key,
	status enum('Aguardando confirmação', 'Em separação', 'Enviado', 'Entregue'),
	rastreio varchar(45),
	idPedido int,
	idCliente int,
	constraint fk_entrega_pedido foreign key (idPedido) references pedido (idPedido),
	constraint fk_entrega_cliente foreign key (idCliente) references pedido (idCliente)
);



CREATE TABLE estoque(
	idEstoque int auto_increment primary key,
    localestoque varchar(255) not null,
    quantidade int default 0
);


CREATE TABLE fornecedor(
	idFornecedor int auto_increment primary key,
    razaosocial varchar(45) not null,
    cnpj char(15) not null,
    contato varchar(11) not null,
    constraint unique_cnpj_fornecedor unique (cnpj)
);


CREATE TABLE vendedor(
	idVendedor int auto_increment primary key,
	razaosocial varchar(45) not null,
    nomefantasia varchar(45),
    cnpj char(15),
    cpf char(9),
    contato varchar(11) not null,
    endereco varchar(45) not null,
    constraint check_cnpj_vendedor unique (cnpj),
    constraint check_cpf_vendedor unique (cpf)
);


CREATE TABLE produtoVendedor(
	idVendedor int,
    idProduto int, 
    quantidade int,
    primary key (idVendedor, idProduto),
    constraint fk_idVendedor_produtoVendedor foreign key (idVendedor) references vendedor (idVendedor),
    constraint fk_idProduto_produtoVendedor foreign key (idProduto) references produto (idProduto)
);

CREATE TABLE produtoFornecedor(
	idFornecedor int,
    idProduto int, 
    quantidade int,
    primary key (idFornecedor, idProduto),
    constraint fk_idFornecedor_produtoFornecedor foreign key (idFornecedor) references fornecedor (idFornecedor),
    constraint fk_idProduto_produtoFornecedor foreign key (idProduto) references produto (idProduto)
);


CREATE TABLE produtoPedido(
	idPedido int,
    idProduto int,
    quantidade int default 1,
    statusproduto enum('Disponível', 'Indisponível') default 'Disponível',
    primary key (idPedido, idProduto),
    constraint fk_pedido_produtoPedido foreign key (idPedido) references pedido (idPedido),
    constraint fk_produto_produtoPedido foreign key (idProduto) references produto (idProduto)
);

CREATE TABLE produtoEstoque(
	idEstoque int,
    idProduto int,
    quantidade int default 1,
    primary key (idEstoque, idProduto),
    constraint fk_estoque_produtoEstoque foreign key (idEstoque) references estoque (idEstoque),
    constraint fk_produto_produtoEstoque foreign key (idProduto) references produto (idProduto)
);










