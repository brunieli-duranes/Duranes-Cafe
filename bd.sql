-- Criação do Banco de Dados
CREATE DATABASE DuranesCafe;
USE DuranesCafe;

-- ==========================
-- Tabela: Categorias
-- ==========================
CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

INSERT INTO Categorias (nome_categoria) VALUES
('Bebidas'),
('Salgados'),
('Doces');

-- ==========================
-- Tabela: Produtos
-- ==========================
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

INSERT INTO Produtos (nome_produto, preco, id_categoria) VALUES
('Café Latte', 7.50, 1),
('Cappuccino', 8.00, 1),
('Suco Natural', 6.00, 1),
('Coxinha', 5.00, 2),
('Empada', 4.50, 2),
('Pão de Queijo', 3.50, 2),
('Brownie', 6.50, 3),
('Pudim', 5.50, 3),
('Bolo de Cenoura', 7.00, 3);

-- ==========================
-- Tabela: Pedidos
-- ==========================
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100),
    data_pedido DATE,
    forma_pagamento VARCHAR(50)
);

INSERT INTO Pedidos (nome_cliente, data_pedido, forma_pagamento) VALUES
('Bruna Lima', '2025-10-29', 'Cartão'),
('Carlos Souza', '2025-10-29', 'Pix'),
('Fernanda Alves', '2025-10-28', 'Dinheiro');

-- ==========================
-- Tabela: Itens_Pedido
-- ==========================
CREATE TABLE Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, valor_unitario) VALUES
(1, 1, 1, 7.50),
(1, 4, 1, 5.00),
(2, 6, 2, 3.50),
(3, 7, 1, 6.50),
(3, 2, 1, 8.00);

-- ==========================
-- Exemplos de Consultas SQL
-- ==========================

-- 1. Listar todos os produtos e suas categorias
SELECT p.nome_produto, c.nome_categoria, p.preco
FROM Produtos p
JOIN Categorias c ON p.id_categoria = c.id_categoria;

-- 2. Ver todos os pedidos com nome do cliente e data
SELECT id_pedido, nome_cliente, data_pedido, forma_pagamento
FROM Pedidos;

-- 3. Ver itens de cada pedido com nomes de produtos e valores
SELECT pe.id_pedido, pe.nome_cliente, pr.nome_produto, i.quantidade, i.valor_unitario
FROM Itens_Pedido i
JOIN Produtos pr ON i.id_produto = pr.id_produto
JOIN Pedidos pe ON i.id_pedido = pe.id_pedido;

-- 4. Atualizar o preço de um produto
UPDATE Produtos SET preco = 8.50 WHERE nome_produto = 'Cappuccino';

-- 5. Remover um produto do cardápio
DELETE FROM Produtos WHERE nome_produto = 'Pudim';
