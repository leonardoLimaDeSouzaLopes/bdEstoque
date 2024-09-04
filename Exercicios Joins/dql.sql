USE bdEstoque

--2)
SELECT descricaoProduto AS 'Descrição produto', nomeFornecedor AS 'Nome fornecedores' FROM tbFornecedor F
	INNER JOIN tbProduto P ON P.idFornecedor = F.idFornecedor

--3)
SELECT descricaoProduto AS 'Nome produto' , nomeFornecedor AS 'Nome fornecedores'FROM tbFornecedor f
	LEFT JOIN tbProduto p ON p.idFornecedor = f.idFornecedor

SELECT descricaoProduto AS 'Nome produto' , nomeFornecedor AS 'Nome fornecedores'FROM tbFornecedor f
	RIGHT JOIN tbProduto p ON p.idFornecedor = f.idFornecedor

--5)
SELECT nomeFornecedor AS 'Fornecedor', descricaoProduto AS 'Produto' FROM tbFornecedor
	FULL JOIN tbProduto ON tbFornecedor.idFornecedor = tbProduto.idFornecedor

--6)
SELECT nomeFornecedor AS 'Fornecedor', descricaoProduto AS 'Produto' FROM tbFornecedor
	CROSS JOIN tbProduto