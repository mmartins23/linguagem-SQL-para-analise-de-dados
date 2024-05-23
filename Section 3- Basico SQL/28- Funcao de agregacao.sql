-- Este comando SQL conta o número de nomes distintos na tabela 'products' e retorna o total com o alias 'total_qty'.
SELECT count(DISTINCT name) as total_qty
FROM testing.products;


-- Este comando SQL seleciona o menor e o maior preço na tabela 'products' e retorna esses valores com os aliases 'min_price' e 'max_price'.
SELECT min(price) as min_price,
       max(price) as max_price
FROM testing.products;


-- Este comando SQL soma a quantidade de usuários cujo estado é 'Rio de Janeiro' na tabela 'customers' e retorna este valor com o alias 'users_rio_de_janeiro_qty'.
SELECT sum(if(state = 'Rio de Janeiro', 1, 0)) as users_rio_de_janeiro_qty
FROM testing.customers;


-- Este comando SQL calcula o preço médio dos produtos por categoria, arredondado para duas casas decimais, e ordena os resultados pelo 'category_id'.
SELECT category_id,
       round(avg(price), 2) as avg_price
FROM testing.products
GROUP BY category_id
ORDER BY category_id;
