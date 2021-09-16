USE curso_mysql_alura;

SELECT * FROM tbproduto t WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

SELECT * FROM tbproduto t WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM tbcliente t WHERE idade >= 18 AND idade <= 22;

SELECT * FROM tbcliente t WHERE idade >= 18 AND idade <= 22 AND SEXO = 'M';

SELECT * FROM tbcliente t WHERE cidade = 'Rio de Janeiro' OR bairro = 'Jardins';

SELECT * FROM tbcliente t WHERE (idade >= 18 AND idade <= 22 AND SEXO = 'M') OR cidade = 'Rio de Janeiro';

SELECT * FROM tbcliente t WHERE idade <> 18;
