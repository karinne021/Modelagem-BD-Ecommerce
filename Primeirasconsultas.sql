select c.*, 
	CONCAT(c2.Fname, ' ', c2.Minit, ' ', c2.Lname) as Nome, 
	'Pessoa Física' as Tipo,
	CONCAT('CPF',' ', c2.cpf )as 'Identificação'
from cliente c
inner join clientepf c2 on c.idCliente  = c2.idCliente 
UNION ALL 
select c3.*, 
	c4.nomefantasia as Nome, 
	'Pessoa Jurídica' as Tipo,
	CONCAT('CNPJ',' ', c4.cnpj) as 'Identificação'
from cliente c3
inner join clientepj c4 on c3.idCliente = c4.idCliente;

select * from pedido p
inner join pagamento p2 ON p.idPedido = p2.idPedido 
inner join formapagamento f on f.idPedido = p.idPedido 
inner join formapagamentoCartao fc on fc.idFormaPagamento = f.idFormaPagamento 
where p.idPedido = 1;

select * from formapagamento f ;

select * from pagamento p ;


select * from pedido p 
inner join entrega e on p.idPedido = e.idPedido 
where p.idPedido = 2

select * from pedido p 
inner join produtoPedido pp on p.idPedido = pp.idPedido 
inner join produto p2 on pp.idProduto = p2.idProduto 
where p.idPedido = 2


select * from produto p 
inner join produtoEstoque pe on pe.idProduto = p.idProduto 
inner join estoque e on e.idEstoque  = pe.idEstoque 
where p.idProduto = 3


select * from produto p 
inner join produtoFornecedor pf on p.idProduto = pf.idProduto 
inner join fornecedor f on f.idFornecedor  = pf.idFornecedor 
where p.idProduto = 3


select * from produto p 
inner join produtoVendedor pv on p.idProduto = pv.idProduto 
inner join vendedor v on v.idVendedor = pv.idVendedor 
where p.idProduto = 1

