-- Exercício 1 - Gestão de Cursos e Alunos
-- 1. Criar o banco de dados:
CREATE DATABASE db_gestao;
USE db_gestao; #seleciona o bd

-- 2. Criar duas tabelas:
-- Tabela 1
CREATE TABLE tb_curso(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
carga_horaria int NOT NULL,
PRIMARY KEY (id)
);

-- Tabela 2
CREATE TABLE tb_aluno(
id_aluno bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
idade int NOT NULL, 
id_curso bigint, 
PRIMARY KEY (id_aluno),
FOREIGN KEY (id_curso) REFERENCES tb_curso(id)
);

-- 3. Inserir 10 registros em cada tabela:
-- Tabela 1:
INSERT INTO tb_curso (nome, carga_horaria)
VALUES ("Desenvolvimento Web", 400),
	   ("Banco de Dados", 200),
       ("Java básico", 300),
	   ("Java avançado", 400),
       ("Python para iniciantes", 250),
       ("Engenharia de Software", 350),
       ("Redes de Computadores", 180),
       ("Segurança de Informação", 220),
       ("Análise de Sistemas", 300),
       ("POO (Programação Orientada a Objetos)", 280);

-- Tabela 2:
INSERT INTO tb_aluno (nome, idade, id_curso)
VALUES ("Ariana Grande", 26, 1),
	   ("Bruna Marquezine", 22, 2),
       ("Taylor Swift", 15, 3),
       ("Larissa Manoela", 39, 4),
       ("Cristiano Ronaldo", 40, 5),
       ("Kendall Jenner", 12, 6),
       ("Zendaya", 17, 7),
       ("Robert Downey Jr", 51, 8),
       ("Keanu Reeves", 80, 9),
       ("Mbappe", 26, 10);

-- 4. Listar todos os registros:
-- Tabela 1:
SELECT * FROM tb_curso;

-- Tabela 2:
SELECT * FROM tb_aluno;

-- 5. Filtrar os alunos maiores de idade:
SELECT * FROM tb_aluno WHERE idade >= 18;

-- 6. Atualizar um registro:
UPDATE tb_aluno SET idade = 23 WHERE id_aluno = 2;
-- obs: para conferir que o registro foi atualizado:
SELECT * FROM tb_aluno;

-- 7. Remover um registro:
DELETE FROM tb_aluno WHERE id_aluno = 6;
-- obs: para conferir que o registro foi removido:
SELECT * FROM tb_aluno;

-- 8. Criar consulta relacionando as tabelas:
SELECT 
	tb_aluno.id_aluno AS "ID aluno",
	tb_aluno.nome AS "Aluno",
    tb_aluno.idade AS "Idade",
    tb_curso.nome AS "Curso",
    tb_curso.carga_horaria AS "Carga Horária"
FROM tb_aluno INNER JOIN tb_curso
ON tb_aluno.id_curso = tb_curso.id
ORDER BY tb_aluno.id_aluno;
