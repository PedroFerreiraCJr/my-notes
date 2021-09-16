USE sucos_vendas;

SELECT * FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes;

SELECT v.BAIRRO, v.NOME, v.DE_FERIAS, c.BAIRRO, c.NOME
FROM tabela_de_vendedores v INNER JOIN tabela_de_clientes c ON v.BAIRRO = c.BAIRRO;

SELECT v.BAIRRO, v.NOME, v.DE_FERIAS, c.BAIRRO, c.NOME
FROM tabela_de_vendedores v LEFT JOIN tabela_de_clientes c ON v.BAIRRO = c.BAIRRO;

-- cross join
SELECT v.BAIRRO, v.NOME, v.DE_FERIAS, c.BAIRRO, c.NOME
FROM tabela_de_vendedores v, tabela_de_clientes c;