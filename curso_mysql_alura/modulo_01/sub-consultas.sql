USE sucos_vendas;

SELECT DISTINCT bairro FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes tdc
	WHERE bairro IN ('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro');

-- é possível utilizar uma sub-consulta também na cláusula where de um select
SELECT * FROM tabela_de_clientes
	WHERE bairro IN (SELECT DISTINCT bairro FROM tabela_de_vendedores);

-- consulta o maior valor da coluna preco_de_lista para determinada embalagem
-- ou seja, o maior preco para determinada embalagem
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) FROM tabela_de_produtos tdp GROUP BY EMBALAGEM;

-- nessa consulta, uma sub-consulta faz o papel de uma tabela
SELECT X.EMBALAGEM, X.PRECO_MAXIMO
	FROM (SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos tdp GROUP BY EMBALAGEM) X
	WHERE X.PRECO_MAXIMO >= 10  