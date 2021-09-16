USE sucos_vendas;

SELECT * FROM tabela_de_produtos tdp;

SELECT * FROM tabela_de_produtos tdp ORDER BY PRECO_DE_LISTA;

SELECT * FROM tabela_de_produtos tdp ORDER BY PRECO_DE_LISTA DESC;

SELECT * FROM tabela_de_produtos tdp ORDER BY NOME_DO_PRODUTO ASC;

SELECT * FROM tabela_de_produtos tdp ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

SELECT * FROM tabela_de_produtos tdp ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO ASC;
