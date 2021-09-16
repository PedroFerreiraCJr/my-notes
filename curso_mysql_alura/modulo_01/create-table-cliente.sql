use curso_mysql_alura;

CREATE TABLE tb_cliente (
	cpf					VARCHAR(11),
	nome					VARCHAR(100),
	endereco1				VARCHAR(150),
	endereco2				VARCHAR(150),
	bairro					VARCHAR(50),
	cidade					VARCHAR(50),
	estado					VARCHAR(50),
	cep					VARCHAR(8),
	idade					SMALLINT,
	sexo					VARCHAR(1),
	limite_credito				FLOAT,
	volume_compra				FLOAT,
	primeira_compra			BIT(1)
);

SELECT * FROM tb_cliente;
