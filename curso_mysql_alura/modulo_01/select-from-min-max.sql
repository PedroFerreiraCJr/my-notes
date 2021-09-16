USE curso_mysql_alura;

SELECT * FROM tbcliente t;

-- idade igual a 22 anos de idade
SELECT * FROM tbcliente t WHERE t.IDADE = 22;

-- maiores que 22
SELECT * FROM tbcliente t WHERE t.IDADE > 22;

-- menores que 22 anos
SELECT * FROM tbcliente t WHERE t.IDADE < 22;

-- maiores ou iqual a 22
SELECT * FROM tbcliente t WHERE t.IDADE <= 22;

-- todos menos com os que tem 22 anos
SELECT * FROM tbcliente t WHERE t.IDADE <> 22;

-- ordena os todos os clientes por ordem ascendente de nome
SELECT * FROM tbcliente t ORDER BY t.NOME ASC;

SELECT * FROM tbproduto t WHERE t.PRECO_LISTA BETWEEN 16.007 AND 16.009;
