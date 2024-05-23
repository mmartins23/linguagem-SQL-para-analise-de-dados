As funções de agregação são usadas em consultas SQL para realizar cálculos em conjuntos de dados. Elas operam em várias linhas de uma tabela e retornam um único valor de resumo. Aqui está uma explicação detalhada das funções de agregação com base nos seus códigos e um breve resumo de cada consulta:

1. **COUNT**: Esta função conta o número de linhas em um conjunto de dados, podendo opcionalmente contar apenas valores distintos. 
2. **MIN e MAX**: São usadas para encontrar o menor e o maior valor, respectivamente, em uma coluna de dados.
3. **SUM**: Calcula a soma dos valores em uma coluna, geralmente aplicada a colunas numéricas.
4. **AVG**: Calcula a média dos valores em uma coluna numérica.

Agora, vamos explicar cada consulta:

```sql
-- Contagem Distinta de Nomes
SELECT count(DISTINCT name) as total_qty
FROM testing.products;
```
Esta consulta usa a função COUNT para contar o número de nomes distintos na coluna 'name' da tabela 'products'. A palavra-chave DISTINCT garante que cada nome seja contado apenas uma vez, mesmo que haja duplicatas na tabela.

```sql
-- Mínimo e Máximo Preço
SELECT min(price) as min_price,
       max(price) as max_price
FROM testing.products;
```
Nesta consulta, as funções MIN e MAX são usadas para encontrar o menor e o maior preço na coluna 'price' da tabela 'products', respectivamente. Os resultados são retornados com os aliases 'min_price' e 'max_price'.

```sql
-- Soma Condicional
SELECT 
count(DISTINCT id) as total_users,
sum(if(state = 'Rio de Janeiro', 1, 0)) as users_rio_de_janeiro_qty
FROM testing.customers;
```
Esta consulta conta o número de IDs únicos na tabela 'customers' e também calcula a quantidade de usuários cujo estado é 'Rio de Janeiro' usando a função SUM com uma expressão condicional.

```sql
-- Preço Médio por Categoria
SELECT category_id,
       round(avg(price), 2) as avg_price
FROM testing.products
GROUP BY category_id
ORDER BY category_id;
```
Nesta consulta, a função AVG é usada para calcular o preço médio dos produtos em cada categoria da tabela 'products'. Os resultados são agrupados pelo 'category_id', e a média é arredondada para duas casas decimais antes de ser retornada.