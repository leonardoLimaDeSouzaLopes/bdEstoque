USE bdEstoque
GO

--1)
CREATE FUNCTION fc_totalVendaseData (@idVenda INT)
RETURNS @Retorno TABLE ( DiaSemana VARCHAR(15), Vendas VARCHAR (60)) -- Retorna dois valores, eh uma funcao de valor de tabela
AS
	BEGIN
	DECLARE @DiaSemana VARCHAR(15) , @DataVenda DATETIME , @Dia INT ,  @Vendas VARCHAR (40)

	SET @DataVenda = (SELECT dataVenda FROM tbVenda	WHERE idVenda = @idVenda)
	SET @Dia = DatePart(dw, @DataVenda)

	IF @Dia = 1
				BEGIN
					SET @DiaSemana = 'DOMINGO'
				END
			IF @Dia = 2
				BEGIN
					SET @DiaSemana = 'SEGUNDA-FEIRA'
				END
			IF @Dia = 3
				BEGIN
					SET @DiaSemana = 'TERCA-FEIRA'
				END
			IF @Dia = 4
				BEGIN
					SET @DiaSemana = 'QUARTA-FEIRA'
				END
			IF @Dia = 5
				BEGIN
					SET @DiaSemana = 'QUINTA-FEIRA'
				END
			IF @Dia = 6
				BEGIN
					SET @DiaSemana = 'SEXTA-FEIRA'
				END
			IF @Dia = 7
				BEGIN
					SET @DiaSemana = 'SABADO'
				END

			SET @Vendas =  (SELECT idVenda + valorTotalVenda + dataVenda FROM tbVenda WHERE idVenda = @idVenda)
			
			INSERT INTO @Retorno (DiaSemana , Vendas) VALUES (@DiaSemana , @Vendas)
			
			RETURN -
			
END

SELECT VendasSemana = dbo.fc__totalVendaseData(1)

--DROP FUNCTION fc__totalVendaseData

--2)
CREATE FUNCTION fc_ClienteTotalVendas (@IdCliente INT)
RETURNS VARCHAR (40)
AS
	BEGIN
		
		DECLARE @Retorno VARCHAR (40)

		SET @Retorno = ( SELECT COUNT(idVenda) FROM tbVenda WHERE idCliente = @IdCliente)

		RETURN @Retorno

END


SELECT NumerodeVendas = dbo.fc_ClienteTotalVendas('id do Cliente')
--DROP FUNCTION ClienteTotalVendas

--3)
ALTER FUNCTION fc_VendedorTotalVendas ( @Vendedor INT , @Mes INT)
RETURNS VARCHAR(40)
AS
BEGIN
	
	DECLARE @Retorno VARCHAR(40), @DataVenda DATETIME

	SET @DataVenda = (SELECT dataVenda FROM tbVenda)
	SET @Mes = DatePart(MONTH, @DataVenda)

	SET @Retorno = (SELECT COUNT(tbVenda.idVenda) AS 'Numero de vendas' FROM tbVenda
	WHERE (idVendedor) = @Vendedor AND dataVenda LIKE @Mes)

	RETURN @Retorno
	END

	SELECT TotaldeVendasVendedor = dbo.fc_VendedorTotalVendas('id do vendedor, mes')
	--DROP FUNCTION VendedorTotalVendas

-- 4)
CREATE FUNCTION fc_CPFVALIDO(@CPFCLIENTE VARCHAR(11))
RETURNS CHAR(1)
AS
BEGIN

DECLARE @INDICE INT,
		@SOMA INT, 
		@DIG1 INT, 
		@DIG2 INT,
		@CPF_TEMP VARCHAR(11),
		@DIGITOS_IGUAIS CHAR(1),
		@RESULTADO CHAR(1)

		SET @RESULTADO = 'N'

		SET @CPF_TEMP = SUBSTRING(@CPF,1,1)

		SET @INDICE=1 
		SET @DIGITOS_IGUAIS='S'

		WHILE (@INDICE <= 11)
		BEGIN
			IF SUBSTRING(@CPF, @INDICE,1)<> @CPF_TEMP
			SET @DIGITOS_IGUAIS = 'N'
			SET @INDICE = @INDICE+1
		END;

		IF @DIGITOS_IGUAIS='N'
		BEGIN

		--Calculando primeiro digito
			SET @SOMA=0 
			SET @INDICE = 1
			WHILE (@INDICE <= 9)
			BEGIN
				SET @SOMA = @SOMA + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1))*(11-@INDICE);
				SET @INDICE = @INDICE + 1
			END

			SET @DIG1 = 11 - (@SOMA % 11)

			IF @DIG1 > 9
				SET @DIG1 = 0;

			--Calculando segundo digito
			SET @SOMA = 0
			SET @INDICE = 1
			
			WHILE (@INDICE <= 10)
			BEGIN
				SET @SOMA = @SOMA + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1))*(12-@INDICE);
				SET @INDICE = @INDICE + 1
			END

			SET @DIG2 = 11 - (@SOMA % 11)

			IF @DIG2 > 9
				SET @DIG2=0;

			IF(@DIG1=SUBSTRING(@CPF,LEN(@CPF)-1,1))AND(@DIG2 =SUBSTRING(@CPF,LEN(@CPF),1))
				SET @RESULTADO='S'
			ELSE
				SET @RESULTADO='N'
			END
		RETURN @RESULTADO
	END

	SELECT ValidarCPF = dbo.fc_CPFVALIDO ('CPF do cliente')
	--DROP FUNCTION fc_CPFVALIDO