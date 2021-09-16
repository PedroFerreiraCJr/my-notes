USE curso_mysql_alura;

ALTER TABLE tb_cliente ADD PRIMARY KEY (cpf);

ALTER TABLE tb_cliente ADD COLUMN data_nascimento DATE;

SELECT * FROM tb_cliente;

INSERT INTO tb_cliente (
	cpf, nome, endereco1, endereco2, bairro, cidade, estado, cep, idade, sexo, limite_credito, volume_compra,
	primeira_compra, data_nascimento
)
VALUES('00388934505', 'João da Silva', 'Rua Projetada A - número 10', '',
'Vila Romã', 'Caratinga', 'Amazonas', '222333', 30, 'M', 10000.0, 2000, 0,
'1989-10-05');
