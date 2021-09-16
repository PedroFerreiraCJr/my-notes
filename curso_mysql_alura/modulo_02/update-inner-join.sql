USE vendas_sucos;

SELECT * FROM vendedores;

SELECT * FROM sucos_vendas.tabela_de_vendedores;

SELECT * FROM vendedores a INNER JOIN sucos_vendas.tabela_de_vendedores b
ON a.MATRICULA = SUBSTRING(b.MATRICULA, 3, 3);

-- atualiza a tabela de vendedores com os valores da tabela de vendedores do outro banco de dados
UPDATE vendedores a INNER JOIN sucos_vendas.tabela_de_vendedores b
	ON a.MATRICULA = SUBSTRING(b.MATRICULA, 3, 3)
	SET a.FERIAS = b.DE_FERIAS;

UPDATE clientes A INNER JOIN vendedores B
	ON A.BAIRRO = B.BAIRRO
	SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;