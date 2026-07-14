-- Exercício 2 - Sistema de funcionários e departamentos
-- 1. Criar o banco de dados:
CREATE DATABASE db_empresa;
USE db_empresa; #seleciona o bd

-- 2. Criar duas tabelas:
-- Tabela 1
CREATE TABLE tb_departamento(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Tabela 2
CREATE TABLE tb_funcionario(
id_funcionario bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
salario decimal(8,2) NOT NULL,
id_departamento bigint, 
PRIMARY KEY (id_funcionario),
FOREIGN KEY (id_departamento) REFERENCES tb_departamento(id)
);

-- 3. Inserir registros em cada tabela:
-- Tabela 1:
INSERT INTO tb_departamento (nome)
VALUES ("Recursos Humanos - RH"),
	   ("Tecnologia de Informação"),
       ("Financeiro"),
	   ("Marketing"),
       ("Comercial");

-- Tabela 2:
INSERT INTO tb_funcionario (nome, salario, id_departamento)
VALUES ("Ana Silva", 2800.00, 1),
	   ("Bruno Costa", 5500.00, 2),
       ("Camila Souza", 4200.00, 3),
       ("Diego Lima", 1900.00, 4),
       ("Fernanda Rocha", 6100.00, 2),
       ("Gabriel Martins", 2200.00, 5),
       ("Juliana Alvez", 1700.00, 3),
       ("Lucas Ferreira", 1500.00, 5);

-- 4. Listar todos os funcionários:
SELECT * FROM tb_funcionario;

-- 5. Filtrar os funcionários com salário maior que 2500:
SELECT * FROM tb_funcionario WHERE salario > 2500.00;

-- 6. Atualizar o salário de um funcionário:
UPDATE tb_funcionario SET salario = 2300 WHERE id_funcionario = 7;
-- obs: para conferir que o dado foi atualizado:
SELECT * FROM tb_funcionario;

-- 7. Remover um funcionario:
DELETE FROM tb_funcionario WHERE id_funcionario = 6;
-- obs: para conferir que o funcionario foi removido:
SELECT * FROM tb_funcionario;

-- 8. Criar consulta relacionando as tabelas:
SELECT 
	tb_funcionario.id_funcionario AS "ID funcionário",
	tb_funcionario.nome AS "Funcionário",
    tb_funcionario.salario AS "Salário",
    tb_departamento.nome AS "Departamento"
FROM tb_funcionario INNER JOIN tb_departamento
ON tb_funcionario.id_departamento = tb_departamento.id
ORDER BY tb_funcionario.id_funcionario;