USE vendas_sucos;

-- deleta um único registro do banco
DELETE FROM produtos WHERE CODIGO = '1001000';

DELETE FROM produtos WHERE TAMANHO = '1 Litro' AND SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes';

SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos;

SELECT CODIGO FROM produtos WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos);

DELETE FROM produtos WHERE CODIGO NOT IN (SELECT CODIGO_DO_PRODUTO FROM sucos_vendas.tabela_de_produtos);

DELETE A FROM notas A
INNER JOIN clientes B ON A.CPF = B.CPF
WHERE B.IDADE <= 18