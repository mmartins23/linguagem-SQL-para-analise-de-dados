-- Definindo CTEs (Common Table Expressions) com o nome 'table1' e 'table2'
WITH table1 AS (
  -- Seleciona a contagem distinta de customer_id e a data do pedido
  SELECT
    COUNT(DISTINCT customer_id) AS compradores,  -- Número de compradores distintos por dia
    DATE(created_at) AS dia                      -- Data do pedido extraída de created_at
  FROM testing.orders
  GROUP BY 2                                     -- Agrupa pelo segundo item selecionado (DATE(created_at))
),

table2 AS (
  -- Seleciona a contagem distinta de id e a data do pedido
  SELECT 
    COUNT(DISTINCT id) AS compras,               -- Número de compras distintas por dia
    DATE(created_at) AS dia                      -- Data do pedido extraída de created_at
  FROM testing.orders
  GROUP BY 2                                     -- Agrupa pelo segundo item selecionado (DATE(created_at))
)

-- Consulta principal que combina os resultados das CTEs 'table1' e 'table2'
SELECT 
  a.compradores,  -- Seleciona o número de compradores de 'table1'
  b.compras,      -- Seleciona o número de compras de 'table2'
  a.dia           -- Seleciona a data de 'table1'
FROM table1 AS a  -- Define um alias 'a' para 'table1'
JOIN table2 AS b ON a.dia = b.dia  -- Realiza um JOIN em 'table2' onde a data é a mesma em ambas as tabelas
WHERE a.dia BETWEEN '2020-01-01' AND '2020-01-31'  -- Filtra os resultados para datas entre 1º e 31 de janeiro de 2020
ORDER BY 3 ASC;  -- Ordena os resultados pela terceira coluna selecionada (a.dia) em ordem ascendente
