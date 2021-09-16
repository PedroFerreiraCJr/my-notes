USE sucos_vendas;

SELECT COUNT(*) FROM tabela_de_clientes;

SELECT cpf, COUNT(*) FROM notas_fiscais nf GROUP BY cpf;

SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM tabela_de_clientes a
INNER JOIN notas_fiscais b ON a.cpf = b.cpf;

-- retorna todos os cliente mesmo que não tenha notas fiscais relacionadas a ele
SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM tabela_de_clientes a
LEFT JOIN notas_fiscais b ON a.cpf = b.cpf;

-- mesmo exemplo, mas utilizando o right join
SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM notas_fiscais b
RIGHT JOIN tabela_de_clientes a ON a.cpf = b.cpf;

-- retorna os cliente que nunca compraram sucos de frutos, portanto, não tem notas fiscais
SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM tabela_de_clientes a
LEFT JOIN notas_fiscais b ON a.cpf = b.cpf
WHERE b.cpf IS NULL;

-- mesmo exemplo, mas utilizando o right join
SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM notas_fiscais b
RIGHT JOIN tabela_de_clientes a ON a.cpf = b.cpf
WHERE b.cpf IS NULL;

-- retorna todos os cliente que não fizeram compra no ano de 2015
SELECT DISTINCT a.cpf, a.nome, b.cpf
FROM tabela_de_clientes a
LEFT JOIN notas_fiscais b ON a.cpf = b.cpf
WHERE b.cpf IS NULL AND YEAR(b.DATA_VENDA) = 2015;