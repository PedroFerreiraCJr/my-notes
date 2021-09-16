USE vendas_sucos;


CREATE TABLE tab_padrao (
	ID 					INT AUTO_INCREMENT,							-- chave-primária auto increment
	DESCRITOR			VARCHAR(20),								-- por padrão o normal é not null
	ENDERECO 			VARCHAR(100) 	NULL,						-- com a definição de NULL, este campo passa a aceita NULL
	CIDADE 				VARCHAR(50)		DEFAULT 'Rio de Janeiro',	-- valor padrão caso não seja fornecido
	DATA_CRIACAO		TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP(),-- data/hora padrão caso não seja fornecido
	PRIMARY KEY (ID)
);

INSERT INTO tab_padrao(DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO)
	VALUES('Cliente X', 'Rua Projetada A', 'São Paulo', '2021-09-14');

SELECT * FROM tab_padrao;

INSERT INTO tab_padrao(DESCRITOR)
	VALUES('Cliente Y');