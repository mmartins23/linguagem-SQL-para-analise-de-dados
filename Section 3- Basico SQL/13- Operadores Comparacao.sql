-- Seleciona o produto com o nome "Sapato"
SELECT *
FROM testing.products
WHERE name = 'Sapato';

-- Seleciona todos os produtos exceto aqueles com preço igual a 70
SELECT *
FROM testing.products
WHERE price != 70;

-- Seleciona todos os produtos com preço menor que 50
SELECT *
FROM testing.products
WHERE price < 50;

-- Seleciona todos os produtos com preço maior que 100
SELECT *
FROM testing.products
WHERE price > 100;

-- Seleciona todos os produtos com preço entre 50 e 100
SELECT *
FROM testing.products
WHERE price BETWEEN 50 AND 100;

-- Seleciona todos os produtos que começam com a letra "P"
SELECT *
FROM testing.products
WHERE name LIKE 'P%';

-- Seleciona todos os produtos nas categorias 0 e 1
SELECT *
FROM testing.products
WHERE category_id IN (0, 1);
