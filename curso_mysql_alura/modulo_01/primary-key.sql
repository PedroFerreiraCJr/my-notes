USE curso_mysql_alura;

-- ref:
-- https://dev.mysql.com/doc/refman/8.0/en/alter-table.html

-- primeira forma de adicionar uma constraint de chave primária
-- o simbolo de identificação da constraint é gerado automaticamante
ALTER TABLE tb_produtos ADD PRIMARY KEY (produto);

-- segunda forma de adicionar uma constraint de chave primária
-- o simbolo de identificação da constraint é explicitamente fornecido
ALTER TABLE tb_produtos ADD CONSTRAINT pk_tb_produtos PRIMARY KEY (id);
