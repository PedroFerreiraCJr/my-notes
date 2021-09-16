USE vendas_sucos;

SELECT * FROM produtos p;

-- atualiza o campo PRECO_LISTA para 5.0 de determinado produto identificado pelo código
UPDATE produtos SET PRECO_LISTA = 5.0 WHERE CODIGO = '1000889';

-- atualiza diversos campos de um mesmo produto identificado pelo seu código
UPDATE produtos
	SET
		EMBALAGEM = 'PET',
		TAMANHO = '1 litro',
		DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva'
	WHERE CODIGO = '1000889';

SELECT * FROM produtos WHERE SABOR = 'Maracujá';

-- aplica uma alteração no campo valor de todos os produtos com o sabor Maracujá
UPDATE produtos SET PRECO_LISTA = PRECO_LISTA * 1.10 WHERE SABOR = 'Maracujá'; 