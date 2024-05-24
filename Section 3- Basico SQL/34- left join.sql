-- Consulta para retornar registros de acessos e compras onde há correspondência de IDs de usuário
SELECT
  DISTINCT a.user_id AS table_acessos, -- Seleciona o ID de usuário da tabela 'acessos' e renomeia como 'table_acessos'
  a.name,                              -- Seleciona o nome da tabela 'acessos'
  c.user_id AS table_compras,          -- Seleciona o ID de usuário da tabela 'compras' e renomeia como 'table_compras'
  c.revenue                            -- Seleciona a receita da tabela 'compras'
FROM
  relationship.acessos AS a            -- Define a tabela 'acessos' como 'a'
LEFT JOIN
  relationship.compras AS c            -- Define a tabela 'compras' como 'c'
ON
  a.user_id = c.user_id;               -- Realiza uma junção LEFT JOIN baseada nos IDs de usuário


-- Consulta para retornar registros de acessos e compras onde há correspondência de IDs de usuário na tabela de compras
SELECT
  DISTINCT a.user_id AS table_acessos, -- Seleciona o ID de usuário da tabela 'acessos' e renomeia como 'table_acessos'
  a.name,                              -- Seleciona o nome da tabela 'acessos'
  c.user_id AS table_compras,          -- Seleciona o ID de usuário da tabela 'compras' e renomeia como 'table_compras'
  c.revenue                            -- Seleciona a receita da tabela 'compras'
FROM
  relationship.acessos AS a            -- Define a tabela 'acessos' como 'a'
LEFT JOIN
  relationship.compras AS c            -- Define a tabela 'compras' como 'c'
ON
  a.user_id = c.user_id                -- Realiza uma junção LEFT JOIN baseada nos IDs de usuário
WHERE
  c.user_id IS NOT NULL;               -- Filtra apenas os registros onde o ID de usuário da tabela 'compras' não é nulo


-- Consulta para retornar registros de acessos onde não há correspondência de IDs de usuário na tabela de compras
SELECT
  DISTINCT a.user_id AS table_acessos, -- Seleciona o ID de usuário da tabela 'acessos' e renomeia como 'table_acessos'
  a.name,                              -- Seleciona o nome da tabela 'acessos'
  c.user_id AS table_compras,          -- Seleciona o ID de usuário da tabela 'compras' e renomeia como 'table_compras'
  c.revenue                            -- Seleciona a receita da tabela 'compras'
FROM
  relationship.acessos AS a            -- Define a tabela 'acessos' como 'a'
LEFT JOIN
  relationship.compras AS c            -- Define a tabela 'compras' como 'c'
ON
  a.user_id = c.user_id                -- Realiza uma junção LEFT JOIN baseada nos IDs de usuário
WHERE
  c.user_id IS NULL;                   -- Filtra apenas os registros onde o ID de usuário da tabela 'compras' é nulo
