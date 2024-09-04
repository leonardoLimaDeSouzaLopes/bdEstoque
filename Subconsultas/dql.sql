USE bdEstoque

--1)
SELECT (tbProduto.idProduto) AS 'Id do Produto' , descricaoProduto AS 'Nome Produto', nomeFabricante AS 'Nome do Fabricante' FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante
		WHERE valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)

--2)
SELECT descricaoProduto AS 'Nome Produto', nomeFabricante AS 'Nome do Fabricante' FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante
		WHERE valorProduto > (SELECT AVG(valorProduto) FROM tbProduto)

--3)
SELECT nomeCliente AS 'Nome do Cliente' FROM tbCliente
	INNER JOIN tbVenda ON tbVenda.idCliente = tbCliente.idCliente
		WHERE valorTotalVenda > (SELECT AVG (valorTotalVenda) FROM tbVenda)

--4)
SELECT descricaoProduto AS 'Nome Produto', valorProduto AS 'Preço' FROM tbProduto
	WHERE valorProduto IN (SELECT MAX(valorProduto) FROM tbProduto)

--5)
SELECT descricaoProduto AS 'Nome Produto', valorProduto AS 'Preço' FROM tbProduto
	WHERE valorProduto IN (SELECT MIN(valorProduto) FROM tbProduto)