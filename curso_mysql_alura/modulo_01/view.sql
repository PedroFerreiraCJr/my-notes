USE sucos_vendas;

-- agrupa os produtos por embalagem, e pega o maior valor do preco_de_lista
SELECT embalagem, max(preco_de_lista) AS maior_preco
	FROM tabela_de_produtos
	GROUP BY EMBALAGEM;


SELECT X.embalagem, X.maior_preco FROM
(SELECT embalagem, max(preco_de_lista) AS maior_preco
	FROM tabela_de_produtos
	GROUP BY EMBALAGEM) X WHERE X.maior_preco >= 10

CREATE OR REPLACE VIEW VW_MAIORES_EMBALAGENS AS
	SELECT embalagem, max(preco_de_lista) AS maior_preco
		FROM tabela_de_produtos
		GROUP BY EMBALAGEM;

SELECT X.embalagem, X.maior_preco FROM
VW_MAIORES_EMBALAGENS X WHERE X.maior_preco >= 10

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, B.MAIOR_PRECO, (A.PRECO_DE_LISTA / B.MAIOR_PRECO * -1) * 100 AS PERCENTUAL
FROM tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS B ON (A.EMBALAGEM = B.EMBALAGEM)