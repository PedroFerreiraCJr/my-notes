USE sucos_vendas;

-- limita o resultado aos primeiros 5 registros da tabela
SELECT * FROM tabela_de_clientes tdc LIMIT 5;

-- semelhante ao comando sql acima, limita o resultado aos primeiros 5 registros da tabela
-- o primeiro indice fornece a pagina, o segundo indice fornece a quantidade de registros
SELECT * FROM tabela_de_clientes tdc LIMIT 0,5;