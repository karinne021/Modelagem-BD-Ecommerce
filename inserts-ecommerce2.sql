-- Selecionar o banco
USE ecommerce2;

-- Inserindo clientes
INSERT INTO cliente (contato, endereco) VALUES 
('11999999999', 'Rua A, 123'),
('21988888888', 'Av B, 456');

-- Cliente PF
INSERT INTO clientepf (cpf, idCliente, Fname, Minit, Lname, datanascimento) VALUES
('12345678901', 1, 'João', 'A', 'Silva', '1990-01-01');

-- Cliente PJ
INSERT INTO clientepj (cnpj, idCliente, razaosocial, nomefantasia) VALUES
('12345678000199', 2, 'Tech Ltda', 'Tech Soluções');

-- Inserindo produtos
INSERT INTO produto (Pname, categoria, valor, avaliacao, size) VALUES
('Notebook', 'Eletrônico', 3500.00, 4.5, NULL),
('Camiseta', 'Vestimenta', 59.90, 4.0, 'M'),
('Sofá', 'Moveis', 1200.00, 4.2, NULL);

-- Inserindo estoque
INSERT INTO estoque (localestoque, quantidade) VALUES
('Centro de Distribuição 1', 100),
('Centro de Distribuição 2', 50);

-- Inserindo fornecedores
INSERT INTO fornecedor (razaosocial, cnpj, contato) VALUES
('Fornecedor A', '11111111000191', '1133334444');

-- Inserindo vendedores
INSERT INTO vendedor (razaosocial, nomefantasia, cnpj, cpf, contato, endereco) VALUES
('Vendedor X', 'VendasX', '22222222000192', NULL, '11987654321', 'Rua das Lojas, 456'),
('Autônomo Y', NULL, NULL, '123456789', '11911223344', 'Av Autônoma, 321');

-- Inserindo produtos dos vendedores
INSERT INTO produtoVendedor (idVendedor, idProduto, quantidade) VALUES
(1, 1, 10),
(2, 2, 30);

-- Inserindo produtos dos fornecedores
INSERT INTO produtoFornecedor (idFornecedor, idProduto, quantidade) VALUES
(1, 1, 20),
(1, 3, 10);

-- Inserindo produtos no estoque
INSERT INTO produtoEstoque (idEstoque, idProduto, quantidade) VALUES
(1, 1, 5),
(1, 2, 10),
(2, 3, 2);

-- Inserindo pedidos
INSERT INTO pedido (idCliente, status, descricao, frete, datapedido) VALUES
(1, 'Processando', 'Pedido do cliente João', 25.00, '2025-04-10'),
(2, 'Enviado', 'Pedido da empresa Tech', 50.00, '2025-04-09');

-- Inserindo produtos em pedidos
INSERT INTO produtoPedido (idPedido, idProduto, quantidade, statusproduto) VALUES
(1, 1, 1, 'Disponível'),
(1, 2, 2, 'Disponível'),
(2, 3, 1, 'Disponível');

-- Inserindo entrega
INSERT INTO entrega (status, rastreio, idPedido, idCliente) VALUES
('Enviado', 'BR123456789', 2, 2);

-- Inserindo pagamentos
INSERT INTO pagamento (datapagamento, valor, descricao, idPedido) VALUES
('2025-04-10', 3584.90, 'Pagamento com cartão', 1),
('2025-04-09', 1250.00, 'Pagamento via Pix', 2);

-- Inserindo forma de pagamento
INSERT INTO formapagamento (tipo, descricao, idPagamento, idPedido) VALUES
('Cartão', 'Cartão de Crédito', 1, 1),
('Pix', 'Pagamento via chave aleatória', 2, 2);

-- Inserindo dados específicos de cartão
INSERT INTO formapagamentoCartao (idFormaPagamento, numero, nometitular, validade, valor) VALUES
(1, '4111111111111111', 'João A Silva', '2027-01-01', 3584.90);

-- Inserindo dados específicos de Pix
INSERT INTO formapagamentoPix (idFormaPagamento, chave, tipochave, valor) VALUES
(2, 'chavepix@tech.com', 'Email', 1250.00);
