USE curso_mysql_alura;

-- seleciona uma data precisamente
SELECT * FROM tbcliente t WHERE DATA_NASCIMENTO = '1995-01-13';

-- seleciona quem nasceu depois da data fornecida
SELECT * FROM tbcliente t WHERE DATA_NASCIMENTO > '1995-01-13';

-- quem nasceu antes da data informada
SELECT * FROM tbcliente t WHERE DATA_NASCIMENTO < '1995-01-13';

-- seleciona todos com data de nascimento em 1995
SELECT * FROM tbcliente t WHERE YEAR(DATA_NASCIMENTO) = 1995;

-- todos que nasceram em outubro
SELECT * FROM tbcliente t WHERE MONTH(DATA_NASCIMENTO) = 10;
