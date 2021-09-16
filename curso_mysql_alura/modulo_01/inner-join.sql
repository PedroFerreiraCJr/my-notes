USE sucos_vendas;

SELECT * FROM tabela_de_vendedores tdv;
SELECT * FROM notas_fiscais nf;

-- todas as notas fiscais e seus vendedores
SELECT * FROM tabela_de_vendedores a INNER JOIN notas_fiscais b ON a.MATRICULA = b.MATRICULA;

-- todas as notas fiscais e seus vendedores
SELECT *
FROM tabela_de_vendedores a
	INNER JOIN notas_fiscais b
WHERE a.MATRICULA = b.MATRICULA;

-- quantidade de notas fiscais por vendedor
SELECT a.matricula, a.nome, COUNT(*) as total_notas
FROM tabela_de_vendedores a
	INNER JOIN notas_fiscais b ON a.MATRICULA = b.MATRICULA
GROUP BY a.matricula, a.nome;

-- calcula o faturamnto anual
SELECT YEAR(DATA_VENDA), ROUND(SUM(QUANTIDADE * PRECO), 2) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)
