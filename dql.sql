USE bdEstoque

--A
SELECT descricaoProduto, nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbFabricante.idFabricante = tbProduto.idFabricante

--B
SELECT descricaoProduto, nomeFornecedor FROM tbProduto
	INNER JOIN tbFornecedor ON tbFornecedor.idFornecedor = tbProduto.idFornecedor