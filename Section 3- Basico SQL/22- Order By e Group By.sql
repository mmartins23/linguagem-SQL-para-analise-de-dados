-- Conta o número de pedidos (orders) por customer_id e retorna o customer_id e a contagem
SELECT customer_id, COUNT(*) AS total_orders
FROM testing.orders
GROUP BY customer_id;

-- Seleciona todas as colunas da tabela orders e ordena os resultados pela coluna created_at em ordem decrescente
SELECT *
FROM testing.orders
ORDER BY created_at DESC;