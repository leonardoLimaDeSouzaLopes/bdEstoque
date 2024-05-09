USE bdEstoque

INSERT INTO tbCliente
	(nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimento)
VALUES
	('Amando Josa Santana', '12345678900', 'amandojsantana@outlook.com', 'm ', '1961-21-02 00:00:00')
	,('Sheila Carvalho Leal', '45678909823', 'scarvalho@ig.com.br', 'f', '1978-13-09 00:00:00')
	,('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'm', '1981-08-09 00:00:00')
	,('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'f', '1962-07-07 00:00:00')
	,('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'f', '1977-09-04 00:00:00')
	,('Paulo Henrique Silva', '87390123111', 'phsilva80@hotmail.com', 'm', '1987-02-02 00:00:00')


INSERT INTO tbFabricante
	(nomeFabricante)
VALUES
	('Unilever')
	,('P&G')
	,('Bunge')
INSERT INTO tbFornecedor
	(nomeFornecedor, contatoFornecedor)
VALUES
	('Atacadao', 'Carlos santos')
	,('Assai', 'Maria Stella')
	,('Roldao', 'Paulo Cesar')

INSERT INTO tbProduto
	( descricaoProduto, valorProduto, quantidadeProduto, idFabricante, idFornecedor)
VALUES
	('Amaciante Downy', 5.76, 1500, 2, 1)
	,('Amaciante Comfort', 5.45, 2300, 1, 1)
	,('Sabao em po OMO', 5.99, 1280, 1, 2)
	,('Margarina Qually', 4.75, 2500, 3, 1)
	,('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2)
	,('Mortadela Perdigao', 2.50, 1200, 3, 3)
	,('Hamburger Sadia', 9.89, 1600, 3, 1)
	,('Fralda Pampers', 36.00, 340, 2, 3)
	,('Xampu Seda', 5.89, 800, 1, 2)
	,('Condicionador Seda', 6.50, 700, 1, 3)

INSERT INTO tbVenda
	(dataVenda, valorTotalVenda, idCliente)
VALUES
	('01/02/2014', 4500.00, 1)
	,('03/02/2014', 3400.00, 1)
	,('10/02/2014', 2100.00, 2)
	,('15/02/2014', 2700.00, 3)
	,('17/03/2014', 560.00, 3)
	,('09/04/2014', 1200.00, 4)
	,('07/05/2014', 3500.00, 5)
	,('07/05/2014', 3400.00, 1)
	,('05/05/2014', 4000.00, 2)

INSERT INTO tbItensVenda
	(idVenda, idProduto , quantidadeItensVenda, subTotalItensVenda)
VALUES
	(1, 1, 200, 1500.00)
	,(1, 2, 300, 3000.00)
	,(2, 4, 120, 1400.00)
	,(2, 2, 200, 1000.00)
	,(2, 3, 130, 1000.00)
	,(3, 5, 200, 2100.00)
	,(4, 4, 120, 1000.00)
	,(4, 5, 450, 700.00)
	,(5, 5, 200, 560.00)
	,(6, 7, 200, 600.00)
	,(6, 6, 300, 600.00)
	,(7, 1, 300, 2500.00)
	,(7, 2, 200, 1000.00)
	,(8, 6, 250, 1700.00)
	,(8, 5, 200, 1700.00)
	,(9, 4, 1000, 4000.00)

--EXERCICIOS JOINS

--4)
INSERT INTO tbProduto
	(descricaoProduto, valorProduto, quantidadeProduto, idFabricante)
VALUES
	('Crocs', 200, 1369, 2)
	,('Cookie', 5, 2400, 3)
	,('Papel Higienico Reutilizado', 12.99, 1690, 1)
