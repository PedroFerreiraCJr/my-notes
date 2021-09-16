USE sucos_vendas;

-- funções de data
-- adiciona um ano a data informada
SELECT ADDDATE('2021-08-08', INTERVAL 1 YEAR) AS DATA FROM dual;

-- adiciona um ano a data informada
-- a função DATE_ADD é semelhante a função ADDDATE, recebendo os mesmo valores de intervalo
SELECT DATE_ADD('2021-08-08', INTERVAL 1 YEAR) AS DATA FROM dual;

-- adiciona um mês a data informada
SELECT ADDDATE('2021-08-08', INTERVAL 1 MONTH) AS DATA FROM dual;

-- adiciona uma semana a data informada
SELECT ADDDATE('2021-08-08', INTERVAL 1 WEEK) AS DATA FROM dual;

-- adiciona um dia a data informada
SELECT ADDDATE('2021-08-08', INTERVAL 1 DAY) AS DATA FROM dual;

-- adiciona uma hora a data informada
SELECT ADDDATE('2021-08-08 15:20:00', INTERVAL 1 HOUR) AS DATA FROM dual;

-- adiciona um minuto a data informada
SELECT ADDDATE('2021-08-08 15:00:00', INTERVAL 10 MINUTE) AS DATA FROM dual;

-- adiciona uma hora a data informada
SELECT ADDDATE('2021-08-08 15:00:00', INTERVAL 10 SECOND) AS DATA FROM dual;

-- adiciona o valor em hora:min a data informada
SELECT ADDTIME('2021-08-08 15:00:00', '01:05') AS DATA FROM dual;

-- retorna a data atual, no formato: yyyy-mm-dd
SELECT CURDATE() AS DATA FROM dual;

-- retorna a data atual, no formato: yyyy-mm-dd
-- mesmo que CURDATE
SELECT CURRENT_DATE() AS DATA FROM dual;

-- retorna a data atual, no formato: yyyy-mm-dd HH:mm:ss
SELECT CURRENT_TIMESTAMP() AS DATA_E_HORA FROM dual;

-- retorna a hora atual, no formato: HH:mm:ss
SELECT CURRENT_TIME() AS HORA FROM dual;

-- retorna o numero de dias entre duas datas
-- o primeiro parâmetro é a data final
-- o segundo parâmetro é a data inicial
SELECT DATEDIFF('2021-08-15', '2021-08-14') AS DIFERENCA_EM_DIAS FROM dual;

-- retorna o nome do dia da semana da data informada
SELECT DAYNAME('2021-08-14') AS DIA_DA_SEMANA FROM dual;

-- extrai o dia da data informada
SELECT DAY('2021-08-14') AS DIA FROM dual;

-- extrai o mês da data informada
SELECT MONTH('2021-08-14') AS MES FROM dual;

-- extrai o ano da data informada
SELECT YEAR('2021-08-14') AS ANO FROM dual;

-- retorna o nome do mes da data informada
SELECT MONTHNAME('2021-08-14') AS MES_DO_ANO FROM dual;

-- subtrai uma semana da data atual
SELECT CURRENT_TIMESTAMP() AS HOJE, DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 1 WEEK) AS RESULTADO FROM dual;

SELECT NOME, TIMESTAMPDIFF(YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE
	FROM  tabela_de_clientes