-- Seleciona registros distintos com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS table_acessos,  -- ID de usuário da tabela acessos, com alias table_acessos                          
  c.user_id AS table_compras,           -- ID de usuário da tabela compras, com alias table_compras
  c.name,                               -- Nome do usuário da tabela compras
  c.revenue                             -- Receita associada ao usuário na tabela compras
FROM
  relationship.acessos AS a             -- Define a tabela acessos com o alias 'a'
RIGHT JOIN            
  relationship.compras AS c             -- Combina com a tabela compras usando o alias 'c', garantindo que todos os registros de compras sejam incluídos
ON
  a.user_id = c.user_id;                -- Condição de junção baseada na coluna user_id em ambas as tabelas


-- Seleciona registros distintos com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS table_acessos,  -- ID de usuário da tabela acessos, com alias table_acessos                          
  c.user_id AS table_compras,           -- ID de usuário da tabela compras, com alias table_compras
  c.name,                               -- Nome do usuário da tabela compras
  c.revenue                             -- Receita associada ao usuário na tabela compras
FROM
  relationship.acessos AS a             -- Define a tabela acessos com o alias 'a'
RIGHT JOIN            
  relationship.compras AS c             -- Combina com a tabela compras usando o alias 'c', garantindo que todos os registros de compras sejam incluídos
ON
  a.user_id = c.user_id                 -- Condição de junção baseada na coluna user_id em ambas as tabelas
WHERE 
  a.user_id IS NULL;                    -- Filtra para incluir apenas os registros onde user_id da tabela acessos é NULL


-- Seleciona registros distintos com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS table_acessos,  -- ID de usuário da tabela acessos, com alias table_acessos                          
  c.user_id AS table_compras,           -- ID de usuário da tabela compras, com alias table_compras
  c.name,                               -- Nome do usuário da tabela compras
  c.revenue                             -- Receita associada ao usuário na tabela compras
FROM
  relationship.acessos AS a             -- Define a tabela acessos com o alias 'a'
RIGHT JOIN            
  relationship.compras AS c             -- Combina com a tabela compras usando o alias 'c', garantindo que todos os registros de compras sejam incluídos
ON
  a.user_id = c.user_id                 -- Condição de junção baseada na coluna user_id em ambas as tabelas
WHERE 
  a.user_id IS NOT NULL;                -- Filtra para incluir apenas os registros onde user_id da tabela acessos não é NULL
