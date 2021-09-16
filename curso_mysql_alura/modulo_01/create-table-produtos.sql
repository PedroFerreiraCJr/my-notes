USE curso_mysql_alura;

CREATE TABLE tb_produtos (
	produto				VARCHAR(20),
	nome					VARCHAR(150),
	embalagem				VARCHAR(50),
	tamanho				VARCHAR(50),
	sabor					VARCHAR(50),
	preco_lista				FLOAT
);

SELECT * FROM tb_produtos;
