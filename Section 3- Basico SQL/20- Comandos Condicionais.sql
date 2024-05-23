-- Seleciona o ID e o nome de todas as categorias da tabela testing.categories
-- Utiliza a cláusula CASE para verificar o nome da categoria e retornar mensagens específicas com base no nome
SELECT 
  id, 
  name, 
  CASE
     WHEN name = 'Cosméticos e Perfumaria' THEN 'Sim, aqui é a categoria Cosméticos e Perfumaria'
     WHEN name = 'Informática' THEN 'Sim, aqui é a categoria Informática'
     ELSE 'Não encontrou as categorias acima'
   END AS case1
FROM testing.categories;

-- Seleciona o ID, o nome e a categoria dos produtos da tabela testing.categories
-- Utiliza a função IF para verificar o nome da categoria e retornar mensagens específicas com base no nome
-- Esta abordagem é semelhante ao CASE, mas usando IF
SELECT 
  id, 
  name, 
  IF(name = 'Cosméticos e Perfumaria', 'Sim, aqui é a categoria Cosméticos e Perfumaria',
     IF(name = 'Informática', 'Sim, aqui é a categoria Informática', 'Não encontrou as categorias acima')) AS case1
FROM 
  testing.categories;

-- Seleciona o ID, o primeiro nome e os complementos dos primeiros 10 clientes da tabela testing.customers
-- Utiliza a função COALESCE para substituir valores nulos na coluna "additionals" pela mensagem "Ops!, o complemento é nulo"
SELECT 
  id, 
  first_name, 
  additionals, 
  COALESCE(additionals, 'Ops!, o complemento é nulo')
FROM 
  testing.customers
LIMIT 10;
