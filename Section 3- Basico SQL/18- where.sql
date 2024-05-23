-- Seleciona todas as colunas da tabela testing.items
-- onde a quantidade é igual a 1
SELECT 
  *
FROM 
  testing.items
WHERE 
  quantity = 1;

-- Seleciona todas as colunas da tabela testing.customers
-- onde o estado é "Bahia" e o email não é nulo
SELECT 
  *
FROM 
  testing.customers
WHERE 
  state = 'Bahia'
  AND email IS NOT NULL;

-- Seleciona todas as colunas da tabela testing.customers
-- onde o estado é "Bahia" ou "Acre" e o email não é nulo
SELECT 
  *
FROM 
  testing.customers
WHERE 
  (state = 'Bahia'
    OR state = 'Acre')
  AND email IS NOT NULL;
