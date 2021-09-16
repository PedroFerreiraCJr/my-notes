UPDATE
    curso_mysql_alura.tb_vendedores
        SET
            percentual_comissao = 0.1,
            nome = 'João Geraldo da Fonseca Junior'
        WHERE
            matricula = '00233';

UPDATE curso_mysql_alura.tb_vendedores SET percentual_comissao = 0.11 where matricula = '00236';

SELECT * FROM curso_mysql_alura;
