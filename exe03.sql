-- Exercício 3 - Sistema de Produtos e Categorias
-- 1. Criar o banco de dados:
CREATE DATABASE db_loja;
USE db_loja; #seleciona o bd

-- 2. Criar duas tabelas:
-- Tabela 1
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Tabela 2
CREATE TABLE tb_produto(
id_produto bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
preco decimal(8,2) NOT NULL,
id_categoria bigint, 
PRIMARY KEY (id_produto),
FOREIGN KEY (id_categoria) REFERENCES tb_categoria(id)
);

-- 3. Inserir registros em cada tabela:
-- Tabela 1:
INSERT INTO tb_categoria (nome)
VALUES ("Informática"),
	   ("Periféricos"),
       ("Smartphones"),
	   ("Áudio e som"),
       ("Games");

-- Tabela 2:
INSERT INTO tb_produto (nome, preco, id_categoria)
VALUES ("Notebook Lenovo IdeaPad", 3499.90, 1),
	   ("Monitor LG 24", 899.90, 1),
       ("Mouse Gamer Redragon", 149.90, 2),
       ("Teclado HyperX", 330.00, 2),
       ("Iphone 15 Pro Max", 6200.00, 3),
       ("Fone JBL Tune 520BT", 250.00, 4),
       ("Caixa de som JBL Go 4", 299.90, 4),
       ("Controle Xbox Wireless", 449.90, 5);

-- 4. Listar todos os produtos:
SELECT * FROM tb_produto;

-- 5. Filtrar os produtos por preço (produtos entre 250 e 500 reais):
SELECT * FROM tb_produto WHERE preco BETWEEN 250.00 and 500.00;

-- 6. Atualizar o preço de um produto identificando-o por id:
UPDATE tb_produto SET preco = 2900.00 WHERE id_produto = 1;
-- obs: para conferir que o preço foi atualizado:
SELECT * FROM tb_produto;

-- 7. Remover um produto:
DELETE FROM tb_produto WHERE id_produto = 4;
-- obs: para conferir que o produto foi removido:
SELECT * FROM tb_produto;

-- 8. Criar consulta relacionando as tabelas:
SELECT 
	tb_produto.id_produto AS "ID do Produto",
	tb_produto.nome AS "Produto",
    tb_produto.preco AS "Preço",
    tb_categoria.nome AS "Categoria"
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.id_categoria = tb_categoria.id
ORDER BY tb_produto.id_produto;