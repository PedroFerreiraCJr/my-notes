USE sucos_vendas;

SELECT DISTINCT bairro FROM tabela_de_clientes;

SELECT DISTINCT bairro FROM tabela_de_vendedores;

SELECT DISTINCT bairro FROM tabela_de_clientes
UNION
SELECT DISTINCT bairro FROM tabela_de_vendedores;

-- não remove as duplicatas
SELECT DISTINCT bairro, nome FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT bairro, nome FROM tabela_de_vendedores;

-- lembrando que o nome das colunas resultante é o do primeiro select
SELECT DISTINCT bairro, nome, 'Cliente' as tipo FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT bairro, nome, 'Vendedor' as tipo FROM tabela_de_vendedores;

-- no mysql não existe full join, ele é simulado com o union