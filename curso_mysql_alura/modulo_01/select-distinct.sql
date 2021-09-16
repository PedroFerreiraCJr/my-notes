USE sucos_vendas;

SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos tdp;

-- elimina as duplicatas na combinação de colunas informadas
SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos tdp;

SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos tdp WHERE SABOR = 'Laranja';

-- a ordem das colunas no distinct não importa, o que importa é a combinação de colunas
SELECT TAMANHO, EMBALAGEM FROM tabela_de_produtos tdp;

SELECT DISTINCT TAMANHO, EMBALAGEM FROM tabela_de_produtos tdp;
