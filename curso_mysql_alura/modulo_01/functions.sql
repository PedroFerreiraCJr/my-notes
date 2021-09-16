USE sucos_vendas;

-- funções
-- função CONCAT: concatena várias strings
SELECT CONCAT('Pedro', ' ', 'Ferreira') as geral FROM dual;

-- função LTRIM: remove os espaços do lado esquerdo da string
SELECT LTRIM('     Pedro') as NOME, LENGTH(LTRIM('     Pedro')) as TAMANHO_APOS_REMOCAO_ESPACO FROM dual;

-- função RTRIM: remove os espaços do lado direito da string
SELECT RTRIM('Pedro     ') as NOME, LENGTH(RTRIM('Pedro     ')) as TAMANHO_APOS_REMOCAO_ESPACO FROM dual;

-- função TRIM: remove os espaços dos dois lados da string
SELECT TRIM('     Pedro     ') as NOME, LENGTH(TRIM('     Pedro     ')) as TAMANHO_APOS_REMOCAO_ESPACO FROM dual;

-- função LCASE: transforma a string de maiúscula para minúscula
SELECT LCASE('Pedro') as NOME_EM_MINUSCULO FROM dual;

-- função LOWER: transforma a string de maiúscula para minúscula, semelhante a LCASE
SELECT LOWER('Pedro') as NOME_EM_MINUSCULO FROM dual;

-- função UCASE: transforma a string de minúscula para maiúscula 
SELECT UCASE('Pedro') as NOME_EM_MAIUSCULO FROM dual;

-- função UPPER: transforma a string de maiúscula para minúscula, semelhante a UCASE
SELECT UPPER('Pedro') as NOME_EM_MAIUSCULO FROM dual;

-- função SUBSTRING: É capaz de obter determinado pedaço de uma string
-- sem o terceiro parâmetro, que determina o final da string, pega do indice informado até o final da string ou coluna
SELECT SUBSTRING('Pedro Ferreira', 7) as SOBRENOME FROM dual;

-- função SUBSTRING: É capaz de obter determinado pedaço de uma string
-- com o terceiro parâmetro informado, pega até o valor informado
SELECT SUBSTRING('Pedro Ferreira', 7, LENGTH('Pedro Ferreira')) as SOBRENOME FROM dual;

-- função LENGTH: Comprimento da string ou coluna
SELECT LENGTH('Pedro Ferreira') as COMPRIMENTO FROM dual;

-- função LENGTH: Inverte uma string
SELECT REVERSE('Pedro') as INVERSO FROM dual;