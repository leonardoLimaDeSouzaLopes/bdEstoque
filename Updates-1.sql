USE bdEstoque
SELECT * FROM tbVenda

-- 1
UPDATE tbProduto
SET valorProduto = 599.50
WHERE idProduto = 2

UPDATE tbProduto
SET valorProduto = 6.6
WHERE idProduto = 3

UPDATE tbProduto
SET valorProduto = 6.47
WHERE idProduto = 9

UPDATE tbProduto
SET valorProduto = 7.45
WHERE idProduto = 10

--2
UPDATE tbProduto
SET valorProduto = 5.36
WHERE idProduto = 1

UPDATE tbProduto
SET valorProduto = 3852
WHERE idProduto = 8

--3
UPDATE tbProduto
SET quantidadeProduto = 1470
WHERE idProduto = 1

UPDATE tbProduto
SET quantidadeProduto = 2270
WHERE idProduto = 2

UPDATE tbProduto
SET quantidadeProduto = 1570
WHERE idProduto = 7

--4
UPDATE tbCliente
SET nomeCliente = 'Adriana Nogueira Campos'
WHERE idCliente = 6


--5
UPDATE tbVenda
SET valorTotalVenda = 4275
WHERE idVenda = 1

UPDATE tbVenda
SET valorTotalVenda = 3230
WHERE idVenda = 2

UPDATE tbVenda
SET valorTotalVenda = 1995
WHERE idVenda = 3

UPDATE tbVenda
SET valorTotalVenda = 2565
WHERE idVenda = 4

--6
DELETE tbProduto
WHERE idProduto = 5 

--7
UPDATE tbProduto
SET valorProduto = 428
WHERE idProduto = 1

UPDATE tbProduto
SET valorProduto = 47960
WHERE idProduto = 2

UPDATE tbProduto
SET valorProduto = 52
WHERE idProduto = 3

UPDATE tbProduto
SET valorProduto = 3.80
WHERE idProduto = 4

UPDATE tbProduto
SET valorProduto = 200
WHERE idProduto = 6

-- 8
UPDATE tbVenda
SET valorTotalVenda = 1795.5
WHERE idVenda = 3

UPDATE tbVenda
SET valorTotalVenda = 1080
WHERE idVenda = 6

UPDATE tbVenda
SET valorTotalVenda = 3600
WHERE idVenda = 10

SELECT * FROM tbVenda WHERE idCliente IN (2,4)

--9
SELECT * FROM tbProduto

UPDATE tbProduto
SET valorProduto = 10.39
WHERE idProduto = 7

--10
UPDATE tbVenda
SET valorTotalVenda = 4360.5
WHERE idVenda = 1

UPDATE tbVenda
SET valorTotalVenda = 3294.6
WHERE idVenda = 2

UPDATE tbVenda
SET valorTotalVenda = 2035
WHERE idVenda = 3

UPDATE tbVenda
SET valorTotalVenda = 2616.3
WHERE idVenda = 4