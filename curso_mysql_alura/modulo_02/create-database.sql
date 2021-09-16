-- a seguinte sql cria um banco de dados
CREATE DATABASE IF NOT EXISTS db_001;
-- a seguinte sql é sinônimo da primeira
CREATE SCHEMA IF NOT EXISTS db_001;

-- para criar um banco de dados com um conjunto de caracteres diferente, use a seguinte sql
CREATE DATABASE IF NOT EXISTS db_002 DEFAULT CHARACTER SET utf8;

-- para apagar um banco de dados juntamento com todas as suas informações, use a seguinte sql
DROP DATABASE IF EXISTS db_002;
-- a seguinte sql é sinônimo da anterior
DROP SCHEMA IF EXISTS db_002;

-- a seguinte sql é semelhante, mas caso o banco não exista, a sql gera um erro
DROP DATABASE db_002;
-- a seguinte sql é sinônimo da anterior
DROP SCHEMA db_002;