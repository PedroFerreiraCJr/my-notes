USE curso_mysql_alura;

-- utilizando select e limit
SELECT * FROM tbcliente AS t;

SELECT cpf AS CPF_CLIENTE, nome AS NOME_CLIENTE FROM tbcliente AS t;

-- retorna os primeiros 5 registros da tabela
SELECT cpf, nome FROM tbcliente t LIMIT 5;

SELECT cpf as cpf_cliente, nome as nome_cliente FROM tbcliente as t;

SELECT nome, sexo as sex, idade, data_nascimento FROM tbcliente as t;

-- utilizando where, and, >
SELECT * FROM tbcliente t WHERE t.ESTADO = 'SP' AND t.IDADE > 30;

SELECT * FROM tbproduto t WHERE t.sabor = 'Cítricos';

UPDATE tbproduto SET sabor = 'Cítricos' WHERE sabor = 'Limão';
