USE sucos_vendas;

-- retorna o valor positivo do parâmetro informado
SELECT ABS(-100.0) as VALOR1, ABS(100.0) as VALOR2 FROM dual; 

SELECT * from tabela_de_produtos tdp 

-- retorna a média dos valores agregados para uma coluna
-- semelhantes: SUM, MIN, MAX, COUNT
SELECT AVG(PRECO_DE_LISTA) AS MEDIA FROM tabela_de_produtos p GROUP BY EMBALAGEM; 

-- arredonda o valor com determinada quantidade de casas decimais
SELECT ROUND(3.141592, 2) AS VALOR FROM dual;

-- ROUND sem casas decimais, arredonda para o valor mais proximo
-- dependendo das casas decimais
SELECT ROUND(3.141592) AS VALOR FROM dual;

-- retorna o inteiro mais proximo arredondando para cima
SELECT CEILING(10.333333) AS VALOR FROM dual;

-- arredonda para baixo
SELECT FLOOR(10.333333) AS VALOR FROM dual;

-- retorna o valor da raiz quadrada de um numero/coluna
SELECT SQRT(64) AS RAIZ_QUADRADA FROM dual;

-- gera um numero aleatório
SELECT RAND() AS ALEATORIO FROM dual;

SELECT NUMERO, QUANTIDADE, PRECO, QUANTIDADE * PRECO AS FATURAMENTO FROM itens_notas_fiscais;

SELECT NUMERO, QUANTIDADE, PRECO, ROUND(QUANTIDADE * PRECO, 2) AS FATURAMENTO FROM itens_notas_fiscais;

-- calcula o valor do imposto pago no ano de 2016
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
	FROM notas_fiscais NF
	INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
	WHERE YEAR(DATA_VENDA) = 2016
	GROUP BY YEAR(DATA_VENDA);