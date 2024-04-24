USE bdEstoque

--A
SELECT tbProduto.descricaoProduto AS 'Produto', tbFabricante.nomeFabricante AS 'Fabricante' FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante

--B
SELECT tbProduto.descricaoProduto AS 'Produto', tbFornecedor.nomeFornecedor AS 'Fornecedor' FROM tbProduto
	INNER JOIN tbFornecedor ON tbFornecedor.idFornecedor = tbProduto.idFornecedor

--C
SELECT SUM (tbProduto.quantidadeProduto) AS 'Quantidade dos Produtos', tbFabricante.nomeFabricante AS 'Fabricante' FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante
	GROUP BY tbFabricante.nomeFabricante

--D
SELECT tbVenda.valorTotalVenda AS 'Valor Venda', tbCliente.nomeCliente AS 'Cliente' FROM tbVenda
	INNER JOIN tbCliente ON tbCliente.idCliente = tbVenda.idCliente

--E
SELECT AVG (tbProduto.valorProduto) AS 'Média dos Preços', tbFornecedor.nomeFornecedor AS 'Fornecedor' FROM tbProduto
	INNER JOIN tbFornecedor ON tbFornecedor.idFornecedor = tbProduto.idFornecedor
	GROUP BY tbFornecedor.nomeFornecedor

--F
SELECT SUM (tbVenda.valorTotalVenda) AS 'Total de Vendas', tbCliente.nomeCliente AS 'Cliente' FROM tbVenda
	INNER JOIN tbCliente ON tbCliente.idCliente = tbVenda.idCliente
	GROUP BY tbCliente.nomeCliente

--G
SELECT SUM (tbProduto.valorProduto) AS 'Total dos Preços', tbFabricante.nomeFabricante AS 'Fabricante' FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante
	GROUP BY tbFabricante.nomeFabricante

--H
SELECT AVG (tbProduto.valorProduto) AS 'Média dos Preços', tbFornecedor.nomeFornecedor AS 'Fornecedor' FROM tbProduto
	INNER JOIN tbFornecedor ON tbFornecedor.idFornecedor = tbProduto.idFornecedor
	GROUP BY tbFornecedor.nomeFornecedor

--I
SELECT SUM (tbVenda.valorTotalVenda) AS 'Vendas', tbProduto.descricaoProduto AS 'Produto' FROM tbProduto
	INNER JOIN tbItensVenda ON tbProduto.idProduto = tbItensVenda.idProduto
		INNER JOIN tbVenda ON tbVenda.idVenda = tbItensVenda.idVenda
		GROUP BY tbProduto.descricaoProduto

--J
SELECT SUM (tbVenda.valorTotalVenda) AS 'Vendas', tbCliente.nomeCliente AS 'Cliente' FROM tbCliente
	INNER JOIN tbVenda ON tbCliente.idCliente = tbVenda.idCliente
	WHERE MONTH(tbVenda.dataVenda) = 2 AND YEAR(tbVenda.dataVenda) = 2014
	GROUP BY tbCliente.nomeCliente