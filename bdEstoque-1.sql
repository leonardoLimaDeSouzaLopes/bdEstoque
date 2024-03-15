CREATE DATABASE bdEstoque
GO

--USE master
--DROP DATABASE bdEstoque

USE bdEstoque

CREATE TABLE tbCliente (
	idCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR(200) NOT NULL
	, cpfCliente CHAR(11) NOT NULL UNIQUE
	, emailCliente VARCHAR(320)
	, sexoCliente CHAR(1)
	, dataNascimento DATETIME NOT NULL
)
--DROP TABLE tbCliente

CREATE TABLE tbVenda (
	idVenda INT PRIMARY KEY IDENTITY(1,1)
	, dataVenda DATETIME NOT NULL
	, valorTotalVenda MONEY NOT NULL
	, idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente) NOT NULL
)
--DROP TABLE tbVenda

CREATE TABLE tbFabricante (
	idFabricante INT PRIMARY KEY IDENTITY(1,1)
	, nomeFabricante VARCHAR(100) NOT NULL
)
--DROP TABLE tbFabricante

CREATE TABLE tbFornecedor (
	idFornecedor INT PRIMARY KEY IDENTITY(1,1)
	, nomeFornecedor VARCHAR(100) NOT NULL
	, contatoFornecedor VARCHAR(50) NOT NULL
)
--DROP TABLE tbFornecedor

CREATE TABLE tbProduto (
	idProduto INT PRIMARY KEY IDENTITY(1,1)
	, descricaoProduto VARCHAR(100) NOT NULL
	, valorProduto MONEY NOT NULL
	, quantidadeProduto INT NOT NULL
	, idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante) NOT NULL
	, idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor) NOT NULL
)
--DROP TABLE tbProduto

CREATE TABLE tbItensVenda (
	idItensVenda INT PRIMARY KEY IDENTITY(1,1)
	, idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda) NOT NULL
	, idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto) NOT NULL
	, quantidadeItensVenda INT NOT NULL
	, subTotalItensVenda MONEY NOT NULL
)
--DROP TABLE tbItensVenda