-- Seleciona os campos id, first_name e last_name da tabela testing.customers
-- onde o id está entre 1 e 5.
SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 1 AND 5

-- Combina os resultados da consulta anterior com os resultados da seguinte.
-- Mantém todas as linhas, incluindo duplicatas.
UNION ALL

-- Seleciona os campos id, first_name e last_name da tabela testing.customers
-- onde o id está entre 4 e 6.
SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 4 AND 6

-- Ordena os resultados combinados pelo id.
ORDER BY id;

--------


SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 1
  AND 5


UNION DISTINCT


SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 4
  AND 6


ORDER BY id;