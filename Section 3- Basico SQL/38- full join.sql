-- Seleciona registros únicos (DISTINCT) com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,  -- ID de usuário da tabela acessos, com alias user_id_tabela_a
  a.name AS name_tabela_a,                 -- Nome da tabela acessos, com alias name_tabela_a
  c.user_id AS user_id_tabela_c,           -- ID de usuário da tabela compras, com alias user_id_tabela_c
  c.name AS name_tabela_c                  -- Nome da tabela compras, com alias name_tabela_c
FROM
  relationship.acessos a                   -- Define a tabela acessos com o alias 'a'
FULL JOIN
  relationship.compras c                   -- Combina com a tabela compras usando o alias 'c'
ON
  a.user_id = c.user_id;                   -- Condição de junção baseada na coluna user_id em ambas as tabelas


-- Seleciona registros únicos (DISTINCT) com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,  -- ID de usuário da tabela acessos, com alias user_id_tabela_a
  a.name AS name_tabela_a,                 -- Nome da tabela acessos, com alias name_tabela_a
  c.user_id AS user_id_tabela_c,           -- ID de usuário da tabela compras, com alias user_id_tabela_c
  c.name AS name_tabela_c                  -- Nome da tabela compras, com alias name_tabela_c
FROM
  relationship.acessos a                   -- Define a tabela acessos com o alias 'a'
FULL JOIN
  relationship.compras c                   -- Combina com a tabela compras usando o alias 'c'
ON
  a.user_id = c.user_id                    -- Condição de junção baseada na coluna user_id em ambas as tabelas
WHERE
  a.user_id IS NULL                        -- Filtra registros onde user_id da tabela acessos é NULL
  OR c.user_id IS NULL;                    -- Ou onde user_id da tabela compras é NULL



-- Seleciona registros únicos (DISTINCT) com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,  -- ID de usuário da tabela acessos, com alias user_id_tabela_a
  a.name AS name_tabela_a,                 -- Nome da tabela acessos, com alias name_tabela_a
  c.user_id AS user_id_tabela_c,           -- ID de usuário da tabela compras, com alias user_id_tabela_c
  c.name AS name_tabela_c,                 -- Nome da tabela compras, com alias name_tabela_c
  u.id AS user_id_tabela_u,                -- ID da tabela usuarios, com alias user_id_tabela_u
  u.name AS name_tabela_u                  -- Nome da tabela usuarios, com alias name_tabela_u
FROM
  relationship.acessos a                   -- Define a tabela acessos com o alias 'a'
FULL JOIN
  relationship.compras c                   -- Combina com a tabela compras usando o alias 'c'
ON
  a.user_id = c.user_id                    -- Condição de junção baseada na coluna user_id em ambas as tabelas
FULL JOIN
  relationship.usuarios u                  -- Combina com a tabela usuarios usando o alias 'u'
ON
  COALESCE(a.user_id, c.user_id) = u.id;   -- Utiliza COALESCE para combinar user_id de acessos ou compras com o id de usuarios


-- Seleciona registros únicos (DISTINCT) com base nas colunas especificadas
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,  -- ID de usuário da tabela acessos, com alias user_id_tabela_a
  a.name AS name_tabela_a,                 -- Nome da tabela acessos, com alias name_tabela_a
  c.user_id AS user_id_tabela_c,           -- ID de usuário da tabela compras, com alias user_id_tabela_c
  c.name AS name_tabela_c,                 -- Nome da tabela compras, com alias name_tabela_c
  u.id AS user_id_tabela_u,                -- ID da tabela usuarios, com alias user_id_tabela_u
  u.name AS name_tabela_u                  -- Nome da tabela usuarios, com alias name_tabela_u
FROM
  relationship.acessos a                   -- Define a tabela acessos com o alias 'a'
FULL JOIN
  relationship.compras c                   -- Combina com a tabela compras usando o alias 'c'
ON
  a.user_id = c.user_id                    -- Condição de junção baseada na coluna user_id em ambas as tabelas
FULL JOIN
  relationship.usuarios u                  -- Combina com a tabela usuarios usando o alias 'u'
ON
  COALESCE(a.user_id, c.user_id) = u.id    -- Utiliza COALESCE para combinar user_id de acessos ou compras com o id de usuarios
WHERE
  COALESCE(a.user_id, c.user_id) IS NULL;  -- Filtra para incluir registros onde COALESCE(a.user_id, c.user_id) é NULL

