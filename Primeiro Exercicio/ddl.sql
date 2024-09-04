CREATE DATABASE bdEstoque
GO

--USE master
--DROP DATABASE bdEstoque

USE bdEstoque

CREATE TABLE tbCliente (
	idCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR(200)
	, cpfCliente CHAR(11) UNIQUE
	, emailCliente VARCHAR(320)
	, sexoCliente CHAR(1)
	, dataNascimento DATETIME
)
--DROP TABLE tbCliente

CREATE TABLE tbVenda (
	idVenda INT PRIMARY KEY IDENTITY(1,1)
	, dataVenda DATETIME
	, valorTotalVenda MONEY
	, idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
)
--DROP TABLE tbVenda

CREATE TABLE tbFabricante (
	idFabricante INT PRIMARY KEY IDENTITY(1,1)
	, nomeFabricante VARCHAR(100)
)
--DROP TABLE tbFabricante

CREATE TABLE tbFornecedor (
	idFornecedor INT PRIMARY KEY IDENTITY(1,1)
	, nomeFornecedor VARCHAR(100)
	, contatoFornecedor VARCHAR(50)
)
--DROP TABLE tbFornecedor

CREATE TABLE tbProduto (
	idProduto INT PRIMARY KEY IDENTITY(1,1)
	, descricaoProduto VARCHAR(100)
	, valorProduto MONEY
	, quantidadeProduto INT
	, idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	, idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
)
--DROP TABLE tbProduto

CREATE TABLE tbItensVenda (
	idItensVenda INT PRIMARY KEY IDENTITY(1,1)
	, idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda)
	, idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	, quantidadeItensVenda INT
	, subTotalItensVenda MONEY
)
--DROP TABLE tbItensVenda