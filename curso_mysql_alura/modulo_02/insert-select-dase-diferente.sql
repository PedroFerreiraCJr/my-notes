-- seleciona a base de dados atual
USE vendas_sucos;

-- faz um select na tabela de produtos da base de dados sucos_vendas, que é a origem dos dados
SELECT * FROM sucos_vendas.tabela_de_produtos;

-- select que faz consulta dos dados na tabela de origem, já removendo os dados duplicados
SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITO, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA
	FROM sucos_vendas.tabela_de_produtos
	WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM produtos);

-- faz o insert dos dados na tabela de produtos do banco atual, onde os dados são provenientes de um select
INSERT INTO produtos
	SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITO, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA AS PRECO_LISTA
	FROM sucos_vendas.tabela_de_produtos
	WHERE CODIGO_DO_PRODUTO NOT IN (SELECT CODIGO FROM produtos);

INSERT INTO clientes
(CPF,NOME,ENDERECO,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA)
	SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP,DATA_DE_NASCIMENTO AS  DATA_NASCIMENTO, IDADE, SEXO,LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA,PRIMEIRA_COMPRA 
	 FROM sucos_vendas.tabela_de_clientes 
	 WHERE CPF NOT IN (SELECT CPF FROM clientes);

SELECT * FROM clientes c ;