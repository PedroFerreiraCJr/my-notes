USE vendas_sucos;

-- uma tabela só pode ter um campo com auto_increment, e este deve ser a chave primária
CREATE TABLE tab_identity(
	id			INT AUTO_INCREMENT,
	descritor	VARCHAR(20),
	PRIMARY KEY (id)
);

INSERT INTO tab_identity (DESCRITOR) VALUES('Cliente 1');

SELECT * FROM tab_identity;

INSERT INTO tab_identity (DESCRITOR) VALUES('Cliente 2');

INSERT INTO tab_identity (DESCRITOR) VALUES('Cliente 3');

-- mesmo efeito de nâo passar o valor para id
INSERT INTO tab_identity (ID, DESCRITOR) VALUES(NULL, 'Cliente 4');

DELETE FROM tab_identity WHERE ID = 5;

INSERT INTO tab_identity (DESCRITOR) VALUES('Cliente 6');

INSERT INTO tab_identity (ID, DESCRITOR) VALUES(100, 'Cliente 100');

INSERT INTO tab_identity (DESCRITOR) VALUES('Cliente 7');