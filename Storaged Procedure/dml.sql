USE bdEstoque;

-- tbCliente
INSERT INTO tbCliente (nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
VALUES
('João Silva', '1985-03-15', 'Rua A', 123, '12345678', 'Centro', 'São Paulo', 'SP', '12345678901', 'M'),
('Maria Oliveira', '1990-07-22', 'Rua B', 234, '87654321', 'Jardins', 'Rio de Janeiro', 'RJ', '10987654321', 'F'),
('Pedro Santos', '1988-01-10', 'Rua C', 345, '13579246', 'Copacabana', 'Rio de Janeiro', 'RJ', '13579135791', 'M'),
('Ana Costa', '1992-12-02', 'Rua D', 456, '24681357', 'Moema', 'São Paulo', 'SP', '24681246812', 'F'),
('Carlos Lima', '1975-11-11', 'Rua E', 567, '35792468', 'Liberdade', 'São Paulo', 'SP', '35792357923', 'M'),
('Juliana Ferreira', '1980-06-25', 'Rua F', 678, '46813579', 'Savassi', 'Belo Horizonte', 'MG', '46813468134', 'F'),
('Rafael Almeida', '1995-09-05', 'Rua G', 789, '57924681', 'Centro', 'Salvador', 'BA', '57924579245', 'M'),
('Bianca Melo', '1987-02-28', 'Rua H', 890, '68135792', 'Itaim Bibi', 'São Paulo', 'SP', '68135681356', 'F'),
('Lucas Rocha', '1991-04-18', 'Rua I', 901, '79246813', 'Pampulha', 'Belo Horizonte', 'MG', '79246792467', 'M'),
('Fernanda Castro', '1983-08-09', 'Rua J', 102, '81357924', 'Centro', 'Recife', 'PE', '81357813578', 'F'),
('Gustavo Pereira', '1982-03-30', 'Rua K', 203, '92468135', 'Boa Viagem', 'Recife', 'PE', '92468924689', 'M'),
('Vanessa Souza', '1993-11-17', 'Rua L', 304, '13579246', 'Centro', 'Fortaleza', 'CE', '13579123579', 'F'),
('Felipe Martins', '1979-12-23', 'Rua M', 405, '24681357', 'Aldeota', 'Fortaleza', 'CE', '24681324683', 'M'),
('Camila Barros', '1986-05-11', 'Rua N', 506, '35792468', 'Jardim América', 'Curitiba', 'PR', '35792535792', 'F'),
('Rodrigo Cardoso', '1994-07-27', 'Rua O', 607, '46813579', 'Centro', 'Porto Alegre', 'RS', '46813468135', 'M'),
('Larissa Araújo', '1989-10-13', 'Rua P', 708, '57924681', 'Menino Deus', 'Porto Alegre', 'RS', '57924579246', 'F'),
('Eduardo Ribeiro', '1981-02-19', 'Rua Q', 809, '68135792', 'Centro', 'Florianópolis', 'SC', '68135681357', 'M'),
('Patrícia Gomes', '1978-01-04', 'Rua R', 910, '79246813', 'Trindade', 'Florianópolis', 'SC', '79246792468', 'F'),
('Bruno Silva', '1996-06-30', 'Rua S', 101, '81357924', 'Centro', 'Goiânia', 'GO', '81357813579', 'M'),
('Carla Moraes', '1984-09-25', 'Rua T', 202, '92468135', 'Setor Bueno', 'Goiânia', 'GO', '92468924681', 'F');

SELECT dataNascimentoCliente FROM tbCliente

-- tbEncomenda
INSERT INTO tbEncomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
VALUES
('2023-09-01 10:00', 1, 100.50, '2023-09-05 10:00'),
('2023-09-02 12:00', 2, 75.20, '2023-09-06 12:00'),
('2023-09-03 14:00', 3, 200.00, '2023-09-07 14:00'),
('2023-09-04 16:00', 4, 150.30, '2023-09-08 16:00'),
('2023-09-05 18:00', 5, 180.40, '2023-09-09 18:00'),
('2023-09-06 10:00', 6, 250.90, '2023-09-10 10:00'),
('2023-09-07 12:00', 7, 95.80, '2023-09-11 12:00'),
('2023-09-08 14:00', 8, 120.70, '2023-09-12 14:00'),
('2023-09-09 16:00', 9, 85.60, '2023-09-13 16:00'),
('2023-09-10 18:00', 10, 210.30, '2023-09-14 18:00'),
('2023-09-11 10:00', 11, 60.40, '2023-09-15 10:00'),
('2023-09-12 12:00', 12, 75.50, '2023-09-16 12:00'),
('2023-09-13 14:00', 13, 95.20, '2023-09-17 14:00'),
('2023-09-14 16:00', 14, 105.10, '2023-09-18 16:00'),
('2023-09-15 18:00', 15, 200.90, '2023-09-19 18:00'),
('2023-09-16 10:00', 16, 90.60, '2023-09-20 10:00'),
('2023-09-17 12:00', 17, 85.40, '2023-09-21 12:00'),
('2023-09-19 14:00', 18, 175.80, '2023-09-23 14:00'),
('2023-09-20 16:00', 19, 132.40, '2023-09-24 16:00'),
('2023-09-21 18:00', 20, 189.70, '2023-09-25 18:00');

-- tbCategoriaProduto
INSERT INTO tbCategoriaProduto (nomeCategoriaProduto)
VALUES
('Bebidas'),
('Laticínios'),
('Carnes'),
('Pães'),
('Grãos'),
('Enlatados'),
('Hortifruti'),
('Congelados'),
('Doces'),
('Biscoitos'),
('Massas'),
('Cereais'),
('Temperos'),
('Óleos'),
('Açúcares'),
('Farinhas'),
('Bebidas Alcoólicas'),
('Limpeza'),
('Higiene Pessoal'),
('Petiscos');

-- tbProduto
INSERT INTO tbProduto (nomeProduto, precoKiloProduto, codCategoriaProduto)
VALUES
('Coca-Cola', 7.50, 1),
('Leite Integral', 4.30, 2),
('Filé de Frango', 18.90, 3),
('Pão Francês', 9.50, 4),
('Arroz Branco', 5.20, 5),
('Feijão Preto', 7.80, 5),
('Tomate', 4.10, 7),
('Sorvete de Creme', 25.00, 8),
('Chocolate ao Leite', 12.90, 9),
('Bolacha Recheada', 6.50, 10),
('Macarrão Espaguete', 4.70, 11),
('Aveia em Flocos', 5.90, 12),
('Sal Grosso', 3.50, 13),
('Óleo de Soja', 6.40, 14),
('Açúcar Refinado', 2.80, 15),
('Farinha de Trigo', 3.10, 16),
('Vinho Tinto', 45.00, 17),
('Detergente Líquido', 2.30, 18),
('Shampoo', 9.90, 19),
('Amendoim Torrado', 8.50, 20);

-- tbItensEncomenda
INSERT INTO tbItensEncomenda (codEncomenda, codProduto, quantidadeKilos, subTotal)
VALUES
(1, 1, 2, 15.00),
(1, 2, 5, 21.50),
(2, 3, 3, 56.70),
(2, 4, 4, 38.00),
(3, 5, 10, 52.00),
(3, 6, 8, 62.40),
(4, 7, 6, 24.60),
(4, 8, 1, 25.00),
(5, 9, 2, 25.80),
(5, 10, 3, 19.50),
(6, 11, 4, 18.80),
(6, 12, 2, 11.80),
(7, 13, 3, 10.50),
(7, 14, 6, 38.40),
(8, 15, 10, 28.00),
(8, 16, 5, 15.50),
(9, 17, 1, 45.00),
(9, 18, 8, 18.40),
(10, 19, 4, 39.60),
(10, 20, 6, 51.00);