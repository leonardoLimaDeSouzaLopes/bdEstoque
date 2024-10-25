USE bdEstoque

-- a) Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo:

CREATE PROCEDURE spInserir_Categoria_Produto
	@nomeCategoriaProduto VARCHAR(50)
	AS
	BEGIN
		INSERT INTO tbCategoriaProduto (nomeCategoriaProduto)
			VALUES (@nomeCategoriaProduto)
		PRINT ('Categoria Produto ' + @nomeCategoriaProduto + ' inserido com sucesso')
	END

EXEC spInserir_Categoria_Produto 'Bolo Festa'
EXEC spInserir_Categoria_Produto 'Bolo Simples'
EXEC spInserir_Categoria_Produto 'Torta'
EXEC spInserir_Categoria_Produto 'Salgado'

-- b) Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado:

CREATE PROCEDURE spInserir_Produto
	@nomeProduto VARCHAR(50)
	, @precoKiloProduto MONEY
	, @codCategoriaProduto INT
	AS
	BEGIN
		IF EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
		BEGIN
			PRINT ('Produto ' + @nomeProduto + ' ja existe, tente usar um nome diferente')
		END
		ELSE
		BEGIN
			INSERT INTO tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto)
			VALUES (@nomeProduto, @precoKiloProduto, @codCategoriaProduto)
			PRINT ('Produto ' + @nomeProduto + ' inserido com sucesso')
		END
	END

EXEC spInserir_Produto 'Bolo Floresta Negra', 42.00, 1
EXEC spInserir_Produto 'Bolo Prestigio', 43.00, 1
EXEC spInserir_Produto 'Bolo Nutella', 44.00, 1
EXEC spInserir_Produto 'Bolo Formigueiro', 17.00, 2
EXEC spInserir_Produto 'Bolo de cenoura', 19.00, 2
EXEC spInserir_Produto 'Torta de palmito', 45.00, 3
EXEC spInserir_Produto 'Torta de frango e catupiry', 47.00, 3
EXEC spInserir_Produto 'Tirta de escarola', 44.00, 3
EXEC spInserir_Produto 'Coxinha de Frango', 25.00, 4
EXEC spInserir_Produto 'Esfiha Carne', 27.00, 4
EXEC spInserir_Produto 'Folhado queijo', 31.00, 4
EXEC spInserir_Produto 'Risoles misto', 29.00, 4

-- c) Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão ser feitas duas validações:
-- - Verificar pelo CPF se o cliente já existe. Caso já exista emitir a mensagem: "Cliente cpf XXXXX já cadastrado" (Acrescentar a coluna CPF)
-- - Verificar se o cliente é morador de Itaquera ou Guaianases, pois a confeitaria não realiza entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses bairros enviar a mensagem "Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é atendido pela confeitaria"

CREATE PROCEDURE spCadastrar_Cliente
	@nomeCliente VARCHAR(50)
	, @dataNascimentoCliente DATE
	, @ruaCliente VARCHAR(50)
	, @numCasaCliente INT
	, @cepCliente CHAR (8)
	, @bairroCliente VARCHAR (50)
	, @sexoCliente CHAR(1)
	, @cpfCliente CHAR(11)
	AS
	BEGIN
		IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		BEGIN
			PRINT ('Cliente cpf  ' + @cpfCliente + ' ja cadastrado')
		END
		ELSE IF (@bairroCliente NOT LIKE 'Guaianases' AND @bairroCliente NOT LIKE 'Itaquera')
		BEGIN
			PRINT ('Nao foi possivel cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' nao e atendido pela confeitaria')
		END
		ELSE
		BEGIN
			INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, sexoCliente, cpfCliente)
			VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @sexoCliente, @cpfCliente)
			PRINT ('Cliente ' + @nomeCliente + ' cadastrado com sucesso')
		END
	END

EXEC spCadastrar_Cliente 'Samira Fatah', '05/05/1990', 'Rua Aguapei', 1000, '08.090-000', 'Guaianases', 'F', '12345678900'
EXEC spCadastrar_Cliente 'Cela Nogueira', '06/06/1992', 'Rua Andes', 234, '08.456-090', 'Guaianases', 'F', '23456789012'
EXEC spCadastrar_Cliente 'Paulo Cesar Siqueira', '04/04/1984', 'Rua Castelo do Piaui', 232, '08.109-000', 'Itaquera', 'M', '34567890123'
EXEC spCadastrar_Cliente 'Rodrigo Favavori', '09/04/1991', 'Rua Sanso Castelo Branco', 10, '08.431-090', 'Guaianases', 'M', '45678901234'
EXEC spCadastrar_Cliente 'Flavia Regina Brito', '22/04/1992', 'Rua Mariano Moro', 300, '08.200-123', 'Itaquera', 'F', '56789012345'

-- ABAIXO É O CÓDIGO DO MATEUS

/*Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo*/

CREATE PROCEDURE spInserir_CategoriaProduto
@nomeCatProduto VARCHAR(50)
AS
	BEGIN

		IF EXISTS (SELECT nomeCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCatProduto)
			BEGIN
				PRINT ('N�o � poss�vel cadastrar a categoria produto! ' + @nomeCatProduto + ' j� existe!')
				END
				ELSE
				BEGIN
					DECLARE @idCatProduto INT
					INSERT INTO tbCategoriaProduto (nomeCategoriaProduto) VALUES
					(@nomeCatProduto)
					SET @idCatProduto = (SELECT MAX(idCategoriaProduto) FROM tbCategoriaProduto)
					print('Produto ' +@nomeCatProduto+ ' Cadastrado com sucesso com c�digo ' +CONVERT(VARCHAR(5), @idCatProduto) )
				END
			END	

/*Execute*/
EXEC spInserir_CategoriaProduto 'Bolo Festa'
EXEC spInserir_CategoriaProduto 'Bolo Simples'
EXEC spInserir_CategoriaProduto 'Torta'
EXEC spInserir_CategoriaProduto 'Salgado'

/*Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure dever�
antes de inserir verificar se o nome do produto j� existe, evitando assim que um produto seja
duplicado:*/

CREATE PROCEDURE spInserir_Produto
@nomeProduto VARCHAR(50)
,@precoKiloProduto SMALLMONEY
,@idCategoriaProduto INT
AS
	BEGIN

		IF EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto = @nomeProduto)
			BEGIN
				PRINT ('N�o � poss�vel cadastrar o produto! ' + @nomeProduto + ' j� existe!')
				END
		ELSE IF EXISTS (SELECT idCategoriaProduto FROM tbCategoriaProduto WHERE idCategoriaProduto = @idCategoriaProduto)
			BEGIN
				DECLARE  @idProduto INT
					INSERT INTO tbProduto(nomeProduto, precoKiloProduto, idCategoriaProduto) VALUES
						(@nomeProduto, @precoKiloProduto, @idCategoriaProduto)
					SET @idProduto = (SELECT MAX(idProduto) FROM tbProduto)
					print('Produto ' +@nomeProduto+ ' Cadastrado com sucesso com c�digo ' +CONVERT(VARCHAR(5), @idProduto) )
					END
				END

--DROP PROCEDURE spInserir_Produto
/*1*/EXEC spInserir_Produto 'Bolo Floresta Negra', '42', 1
/*2*/EXEC spInserir_Produto 'Bolo Prest�gio', '43', 1
/*3*/EXEC spInserir_Produto 'Bolo Nutella', '44', 1
/*4*/EXEC spInserir_Produto 'Bolo Formigueiro', '17', 2
/*5*/EXEC spInserir_Produto 'Bolo de Cenoura', '19', 2
/*6*/EXEC spInserir_Produto 'Torta de palmito', '45', 3
/*7*/EXEC spInserir_Produto 'Torta de frango e catupiry', '47', 3
/*8*/EXEC spInserir_Produto 'Tirta de escarola', '44', 3
/*9*/EXEC spInserir_Produto 'Coxinha de Frango', '25', 4
/*10*/EXEC spInserir_Produto 'Esfiha Carne', '27', 4
/*11*/EXEC spInserir_Produto 'Folhado queijo', '31', 4
/*12*/EXEC spInserir_Produto 'Risoles misto', '29', 4

/*Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que dever�o
ser feitas duas valida��es:
- Verificar pelo CPF se o cliente j� existe. Caso j� exista emitir a mensagem: �Cliente cpf XXXXX
j� cadastrado� (Acrescentar a coluna CPF)
- Verificar se o cliente � morador de Itaquera ou Guaianases, pois a confeitaria n�o realiza
entregas para clientes que residam fora desses bairros. Caso o cliente n�o seja morador desses
bairros enviar a mensagem �N�o foi poss�vel cadastrar o cliente XXXX pois o bairro XXXX n�o �
atendido pela confeitaria� */

CREATE PROCEDURE spInserir_Cliente
@nomeCliente VARCHAR(80)
,@dataNascimentoCliente SMALLDATETIME
,@ruaCliente VARCHAR(50)
,@numCasaCliente INT
,@cep CHAR(10)
,@bairroCliente VARCHAR(80)
,@sexoCliente CHAR(1)
,@cpf CHAR(11)
AS
	BEGIN 
		IF EXISTS (SELECT cpf FROM tbCliente WHERE cpf = @cpf)
		BEGIN
			PRINT ('Cliente cpf ' + @cpf + ' j� cadastrado!')
		END
		ELSE IF @bairroCliente = 'Itaquera' OR @bairroCliente = 'Guaianases'
			BEGIN
			DECLARE @idCliente INT
				INSERT INTO tbCliente (nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, sexoCliente, cpf) VALUES
					(@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cep, @bairroCliente, @sexoCliente, @cpf)
				SET @idCliente = (SELECT MAX(idCliente) FROM tbCliente)
					print('Cliente ' +@nomeCliente+ ' Cadastrado com sucesso com c�digo ' +CONVERT(VARCHAR(5), @idCliente) )
				END	
				ELSE
					BEGIN
					PRINT('N�o foi poss�vel cadastrar o cliente ' +@nomeCliente+ ' pois o bairro '+ @bairroCliente +' n�o � atendido pela confeitaria')
				END
			END


--DROP PROCEDURE spInserir_Cliente
/*1*/EXEC spInserir_Cliente 'Samira Fatah', '05/05/1990', 'Rua Aguape�', 1000, '08.090-000', 'Guaianases', 'F', '123456789012'
/*2*/EXEC spInserir_Cliente 'Cela Nogueira', '06/06/1992', 'Rua Andes', 234, '08.456-090', 'Guaianases', 'F', '132487659012'
/*3*/EXEC spInserir_Cliente 'Paulo Cesar Siqueira', '04/04/1984', 'Rua Castelo do Piau�', 232, '08.109-000', 'Itaquera', 'M', '028346192347'
/*4*/EXEC spInserir_Cliente 'Rodrigo Favavori', '09/04/1991', 'Rua Sans�o Castelo Branco', 10, '08.431-090', 'Guaianases', 'M', '723640192348'
/*5*/EXEC spInserir_Cliente 'Fl�via Regina Brito', '22/04/1992', 'Rua Mariano Moro', 300, '08.200-123', 'Itaquera', 'F', '834610239912'

/*Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verifica��es abaixo:
- No momento da encomenda o cliente ir� fornecer o seu cpf. Caso ele n�o tenha sido
cadastrado enviar a mensagem �C xxxx n�o est� cadastrado�
- Verificar se a data de entrega n�o � menor do que a data da encomenda. Caso seja enviar a
mensagem �n�o � poss�vel entregar uma encomenda antes da encomenda ser realizada�
- Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: �Encomenda XXX para
o cliente YYY efetuada com sucesso� sendo que no lugar de XXX dever� aparecer o n�mero da
encomenda e no YYY dever� aparecer o nome do cliente;*/

CREATE PROCEDURE spInserir_Encomenda
@cpf CHAR(11)
,@dataEncomenda SMALLDATETIME
,@valorTotalEncomenda MONEY
,@dataEntrega SMALLDATETIME
AS
	BEGIN
	DECLARE @nomeCliente VARCHAR(80)
	DECLARE @idCliente INT
	DECLARE @idEncomenda INT

		IF NOT EXISTS (SELECT cpf FROM tbCliente WHERE cpf = @cpf)
		BEGIN 
			PRINT ('CPF ' + @cpf + ' n�o est� cadastrado!')
			RETURN /*Encerra o c�digo pelo oq entendi*/
		END
		ELSE
			BEGIN
				SET @idCliente = (SELECT idCliente FROM tbCliente WHERE cpf = @cpf)
				SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpf = @cpf)
			END
		IF EXISTS (SELECT dataEntregaEncomenda, dataEncomenda FROM tbEncomenda 
				WHERE idCliente = @idCliente AND dataEntregaEncomenda = @dataEntrega AND dataEncomenda = @dataEncomenda)
		BEGIN
			PRINT ('Est� entrega est� cadastrada')
			RETURN
		END
			ELSE IF @dataEncomenda < @dataEntrega
			BEGIN
				INSERT INTO tbEncomenda (dataEncomenda, idCliente, valorTotalEncomenda, dataEntregaEncomenda) VALUES
				(@dataEncomenda, @idCliente, @valorTotalEncomenda, @dataEntrega)
				SET @idEncomenda = (SELECT MAX(idEncomenda) FROM tbEncomenda) /*Vai pegar o �ltimo ID gerado*/
			PRINT('Encomenda ' +CONVERT(VARCHAR(5),@idEncomenda)+ ' para o cliente ' +@nomeCliente+ ' efetuada com sucesso') 
		END
		ELSE
		BEGIN
			PRINT('n�o � poss�vel entregar uma encomenda antes da encomenda ser realizada') 
		END
	END

--DROP PROCEDURE spInserir_Encomenda
/*1*/EXEC spInserir_Encomenda 'Samira Fatah', '123456789012', '08/08/2015', '450', '15/08/2015'
/*2*/EXEC spInserir_Encomenda 'Cela Nogueira', '132487659012', '10/10/2015', '200', '15/10/2015'
/*3*/EXEC spInserir_Encomenda 'Paulo Cesar Siqueira', '028346192347', '10/10/2015', '150', '10/12/2015'
/*4*/EXEC spInserir_Encomenda 'Samira Fatah', '123456789012', '06/10/2015', '250', '12/10/2015'
/*5*/EXEC spInserir_Encomenda 'Rodrigo Favarori', '723640192348', '05/10/2015', '150', '12/10/2015'

/*Ao adicionar a encomenda, criar uma Stored procedure, para que sejam inseridos os itens da
encomenda conforme tabela a seguir. */

CREATE PROCEDURE spInsert_ItensEncomenda
@idEncomenda INT
,@nomeProduto VARCHAR(80)
,@quantidadeKg DECIMAL(10,2)
,@subtotal MONEY
AS
	BEGIN
		DECLARE @idProduto INT
			IF NOT EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
			BEGIN
				PRINT ('O produto n�o existe.')
				RETURN
			END
			ELSE
			BEGIN
				SET @idProduto = (SELECT idProduto FROM tbProduto WHERE LOWER(RTRIM(nomeProduto)) = LOWER(RTRIM(@nomeProduto)))
			END
			IF NOT EXISTS (SELECT idItensEncomenda, tbProduto.idProduto FROM tbItensEncomenda
			INNER JOIN tbProduto ON tbItensEncomenda.idProduto = tbProduto.idProduto 
			WHERE @idProduto = tbProduto.idProduto AND @idEncomenda = idEncomenda)
			BEGIN
				INSERT INTO tbItensEncomenda (idEncomenda, idProduto, quantidadeKilos, subTotal) VALUES
					(@idEncomenda, @idProduto, @quantidadeKg, @subtotal)
					PRINT ('Encomenda adicionada!')
			END
			ELSE
			BEGIN
				PRINT ('Item j� existe na encomenda.')
			END
		END

--DROP PROCEDURE spInsert_ItensEncomenda
/*1*/EXEC spInsert_ItensEncomenda 1, 'Bolo Floresta Negra', '2.5', '105'
/*2*/EXEC spInsert_ItensEncomenda 1, 'Esfiha carne', '2.6', '70'
/*3*/EXEC spInsert_ItensEncomenda 1, 'Coxinha Frango',	'6', '150'
/*4*/EXEC spInsert_ItensEncomenda 1, 'Risoles misto', '4.3', '125'
/*5*/EXEC spInsert_ItensEncomenda 2, 'Coxinha Frango', '8', '200'
/*6*/EXEC spInsert_ItensEncomenda 3, 'Folhado queijo', '3.2', '100'
/*7*/EXEC spInsert_ItensEncomenda 3, 'Coxinha frango', '2', '50'
/*8*/EXEC spInsert_ItensEncomenda 4, 'Bolo Prest�gio', '3.5', '150'
/*9*/EXEC spInsert_ItensEncomenda 4, 'Bolo Nutella', '2.2', '100'
/*10*/EXEC spInsert_ItensEncomenda 5, 'Torta de palmito', '3.4', '150'

/*Ap�s todos os cadastros, criar Stored procedures para alterar o que se pede:
1- O pre�o dos produtos da categoria �Bolo festa� sofreram um aumento de 10%
2- O pre�o dos produtos categoria �Bolo simples� est�o em promo��o e ter�o um desconto
de 20%;
3- O pre�o dos produtos categoria �Torta� aumentaram 25%
4- O pre�o dos produtos categoria �Salgado�, com exce��o da esfiha de carne, sofreram um
aumento de 20%
*/

CREATE PROCEDURE spUpdate
AS
UPDATE tbProduto
SET precoKiloProduto = precoKiloProduto * 1.10 FROM tbProduto
INNER JOIN tbCategoriaProduto ON tbProduto.idCategoriaProduto = tbCategoriaProduto.idCategoriaProduto
WHERE nomeCategoriaProduto = 'Bolo Festa'

UPDATE tbProduto
SET precoKiloProduto = precoKiloProduto-(precoKiloProduto * 0.80) FROM tbProduto
INNER JOIN tbCategoriaProduto ON tbProduto.idCategoriaProduto = tbCategoriaProduto.idCategoriaProduto
WHERE nomeCategoriaProduto = 'Bolo Simples'

UPDATE tbProduto
SET precoKiloProduto = precoKiloProduto * 1.25 FROM tbProduto
INNER JOIN tbCategoriaProduto ON tbProduto.idCategoriaProduto = tbCategoriaProduto.idCategoriaProduto
WHERE nomeCategoriaProduto = 'Torta'

UPDATE tbProduto
SET precoKiloProduto = precoKiloProduto * 1.20 FROM tbProduto
INNER JOIN tbCategoriaProduto ON tbProduto.idCategoriaProduto = tbCategoriaProduto.idCategoriaProduto
WHERE nomeCategoriaProduto = 'Salgado' AND nomeProduto NOT LIKE 'Esfiha carne'

EXEC spUpdate

/*Criar uma procedure para excluir clientes pelo CPF sendo que:
1- Caso o cliente possua encomendas emitir a mensagem �Impossivel remover esse cliente pois o
cliente XXXXX possui encomendas; onde XXXXX � o nome do cliente.
2- Caso o cliente n�o possua encomendas realizar a remo��o e emitir a mensagem �Cliente XXXX
removido com sucesso�, onde XXXX � o nome do cliente*/

CREATE PROCEDURE spDel_Cpf
@cpf CHAR(11)
AS
	BEGIN
	DECLARE @nomeCliente VARCHAR(80)
		IF EXISTS (SELECT cpf FROM tbCliente WHERE cpf = @cpf)
		BEGIN
			
			SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpf = @cpf)
		END
		IF EXISTS(SELECT tbCliente.idCliente FROM tbEncomenda
		INNER JOIN tbCliente ON tbEncomenda.idCliente = tbCliente.idCliente
		WHERE @cpf = cpf)
		BEGIN
			PRINT ('Impossivel remover esse cliente pois o cliente '+@nomeCliente+' possui encomendas')
		END
		ELSE
		BEGIN
			DELETE FROM tbCliente WHERE cpf = @cpf
			PRINT ('Cliente '+@nomeCliente+' removida com sucesso')
		END
	END

--DROP PROCEDURE spDel_Cpf
EXEC spDel_Cpf '834610239912'

/*Criar uma procedure que permita excluir qualquer item de uma encomenda cuja data de
entrega seja maior que a data atual. Para tal o cliente dever� fornecer o c�digo da encomenda
e o c�digo do produto que ser� exclu�do da encomenda. A procedure dever� remover o item e
atualizar o valor total da encomenda, do qual dever� ser subtra�do o valor do item a ser
removido. A procedure poder� remover apenas um item da encomenda de cada vez.*/

CREATE PROCEDURE spDel_Item
@idEncomenda INT
,@idProduto INT
AS
	BEGIN
		DECLARE @dinheiro MONEY 
		IF EXISTS (SELECT idEncomenda, idProduto FROM tbItensEncomenda WHERE idEncomenda = @idEncomenda AND idProduto = @idProduto)
			BEGIN
				SET @dinheiro = (SELECT subtotal FROM tbItensEncomenda WHERE idEncomenda = @idEncomenda AND idProduto = @idProduto)
				 UPDATE tbEncomenda
				SET valorTotalEncomenda = valorTotalEncomenda - @dinheiro
				WHERE idEncomenda = @idEncomenda
				DELETE FROM tbItensEncomenda WHERE idEncomenda = @idEncomenda AND idProduto = @idProduto
			END
		END

--DROP PROCEDURE spDel_Item
EXEC spDel_Item 1, 1
