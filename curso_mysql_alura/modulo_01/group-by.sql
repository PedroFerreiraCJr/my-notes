USE sucos_vendas;

-- obtem o total de limite de credito para cada estado
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabela_de_clientes tdc GROUP BY ESTADO;

SELECT EMBALAGEM, PRECO_DE_LISTA FROM tabela_de_produtos tdp;

-- obtem o maior valor de preco de lista de um produto, mostrando a embalagem do mesmo
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos tdp GROUP BY EMBALAGEM;

-- obtem a quantidade de produtos de cada embalagem
SELECT EMBALAGEM, COUNT(*) CONTADOR FROM tabela_de_produtos tdp GROUP BY EMBALAGEM;

-- obtem o total de limite de credito de cada bairro
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_CREDITO FROM tabela_de_clientes tdc GROUP BY BAIRRO;

-- obtem o limite de credito de cada bairro, para as cidade do Rio de Janeiro
SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE_CREDITO FROM tabela_de_clientes tdc
	WHERE CIDADE = 'Rio de Janeiro' GROUP BY BAIRRO;

-- obtem o total de credito de cada bairro, agrupando por estado e cidade
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes tdc
	GROUP BY ESTADO, BAIRRO;

-- obtem o total de credito de estado e bairro para as cidades do Rio de Janeiro
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes tdc
	WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO;

-- obtem o tolta de credito de estado e bairro para as cidades do Rio de Janeiro ordenadas
-- por bairro de forma ascendente
SELECT ESTADO, BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes tdc
	WHERE CIDADE = 'Rio de Janeiro' GROUP BY ESTADO, BAIRRO ORDER BY BAIRRO;

