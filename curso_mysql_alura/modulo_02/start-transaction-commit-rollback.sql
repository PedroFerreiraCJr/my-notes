USE vendas_sucos;


START TRANSACTION;

UPDATE vendedores SET COMISSAO = COMISSAO * 1.15;

SELECT * FROM vendedores v;

ROLLBACK;


START TRANSACTION;

UPDATE vendedores SET COMISSAO = COMISSAO * 1.15;

SELECT * FROM vendedores v;

ROLLBACK;


START TRANSACTION;

INSERT INTO vendedores(MATRICULA, NOME, BAIRRO, COMISSAO, DATA_ADMISSAO, FERIAS)
	VALUES('1999', 'João da Silva', 'Icaraí', 0.08, '2012-01-15', 0);

UPDATE vendedores SET COMISSAO = COMISSAO * 1.15 WHERE MATRICULA = '1999';

SELECT * FROM vendedores v;

ROLLBACK;