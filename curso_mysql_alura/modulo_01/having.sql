USE sucos_vendas;

-- dentro dos grupos selecionados na cláusula GROUP BY, é possível fazer
-- filtros nos grupos resultantes.
-- obtem estado e total de credito de cadas estado, mas que tenham o este valor maior que 900000
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes tdc
	GROUP BY ESTADO
	HAVING LIMITE > 900000;

-- obtem embalagem, maior preco, menor preco da tabela de produtos agrupandos por embalagens iguais 
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
	FROM tabela_de_produtos tdp
	GROUP BY EMBALAGEM;

-- faz um filtro nos grupos resultantes da cláusula group by, para obter somente os que se encaixam
-- na condição total menor igual a 80 E o maior preco maior ou igual a 5
SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) PRECO,
	MAX(PRECO_DE_LISTA) AS MAIOR_PRECO,
	MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM tabela_de_produtos tdp
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) <= 80 AND MAX(PRECO_DE_LISTA) >= 5;

