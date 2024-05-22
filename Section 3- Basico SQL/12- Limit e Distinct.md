### Comando DISTINCT e LIMIT em SQL

#### DISTINCT

O comando `DISTINCT` em SQL é usado para remover duplicatas dos resultados da consulta. Quando uma coluna contém valores repetidos, `DISTINCT` garante que apenas valores únicos sejam retornados.

##### Sintaxe

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

#### LIMIT

O comando `LIMIT` em SQL é usado para restringir o número de registros retornados por uma consulta. É particularmente útil quando você quer obter apenas um subconjunto dos resultados.

##### Sintaxe

```sql
SELECT column1, column2, ...
FROM table_name
LIMIT number_of_rows;
```

### Análise das Queries

#### Query 1: Selecionando `category_id` Distintos

```sql
SELECT DISTINCT
  category_id
FROM
  testing.products;
```

##### Estrutura da Tabela `products`

```
| id | name               | price | category_id |
|----|--------------------|-------|-------------|
|  1 | Sapato             | 96    | 0           |
|  2 | Bolsa              | 21    | 0           |
|  3 | Calça              | 75    | 0           |
|  4 | Camisa             | 70    | 0           |
|  5 | Vestido            | 57    | 0           |
|  6 | Perfume            | 29    | 1           |
|  7 | Creme de Barbear   | 15    | 1           |
|  8 | Hidratante         | 10    | 1           |
|  9 | Shampoo            | 15    | 1           |
| 10 | Protetor Solar     | 11    | 1           |
| 11 | Geladeira          | 1952  | 2           |
| 12 | Fogão              | 1373  | 2           |
| 13 | TV                 | 1992  | 2           |
| 14 | Máquina de Lavar   | 1826  | 2           |
| 15 | Máquina de Secar   | 1774  | 2           |
| 16 | O Romance Exagerado| 46    | 3           |
| 17 | Suspense Demais    | 42    | 3           |
| 18 | Terror Aterrorizante| 45   | 3           |
| 19 | A Comédia Engraçada| 20    | 3           |
| 20 | A História de SQL  | 23    | 3           |
| 21 | Ai-Fone            | 1720  | 4           |
| 22 | Galáxia R10        | 2007  | 4           |
```

##### Explicação

Esta query seleciona todos os valores únicos da coluna `category_id` na tabela `products`. Como resultado, a query retornará uma lista de IDs de categoria distintos, eliminando duplicatas:

##### Resultado Esperado

```
| category_id |
|-------------|
| 0           |
| 1           |
| 2           |
| 3           |
| 4           |
```

#### Query 2: Selecionando os Primeiros 5 Clientes

```sql
SELECT 
  first_name, last_name, email
FROM
  testing.customers
LIMIT 5;
```

##### Estrutura da Tabela `customers`

```
| id | created_at             | first_name | last_name | email               | cell_phone  | country | state | street              | number | additionals |
|----|------------------------|------------|-----------|---------------------|-------------|---------|-------|---------------------|--------|-------------|
|  1 | 2018-01-26 03:29:13 UTC| Mariana    | Góes      | mariana@meu_email.com| 9 7324-4293| Brasil  | null  | null                | null   | Apto 25     |
|  2 | 2018-02-03 07:37:38 UTC| Cristiano  | Almeida   | cristiano@usuario.com| 9 2630-9907| Brasil  | null  | null                | null   | Conjunto 24 |
|  3 | 2018-11-01 15:39:40 UTC| Carol      | Bueno     | carol@meu_email.com  | 9 3760-2211| Brasil  | null  | null                | null   | Conjunto 26 |
|  4 | 2018-10-01 11:35:59 UTC| Mariana    | Rosa      | mariana@usuario.com  | 9 3139-2145| Brasil  | null  | null                | null   | null        |
|  5 | 2017-11-01 14:45:41 UTC| Marta      | Jesus     | null                | 9 9102-7834| Brasil  | Acre  | null                | null   | Conjunto 16 |
|  6 | 2018-11-08 11:12:47 UTC| Luan       | Lima      | luan@teste.com       | 9 2529-8197| Brasil  | Acre  | Praça 86 do Estado Acre| 303.0  | Apto 27     |
|  7 | 2018-08-16 20:25:23 UTC| Beatriz    | Abreu     | beatriz@usuario.com  | 9 2254-6798| Brasil  | Acre  | Rua 95 do Estado Acre| 482.0  | Conjunto 16 |
|  8 | 2017-10-16 16:29:15 UTC| Beatriz    | Bueno     | beatriz@teste.com    | 9 4435-2960| Brasil  | Acre  | Rua 71 do Estado Acre| 978.0  | Apto 24     |
|  9 | 2018-08-06 07:24:16 UTC| Romário    | Teixeira  | null                | 9 3093-6522| Brasil  | Bahia | Praça 56 do Estado Bahia| 191.0  | Apto 12     |
| 10 | 2018-02-21 15:35:55 UTC| Diego      | Freire    | diego@teste.com      | 9 6686-4094| Brasil  | Bahia | Praça 4 do Estado Bahia | 906.0  | Apto 20     |
```

##### Explicação

Esta query seleciona os primeiros 5 registros da tabela `customers`, retornando as colunas `first_name`, `last_name` e `email`. A cláusula `LIMIT 5` garante que apenas os primeiros 5 registros sejam retornados, com base na ordem natural dos registros na tabela.

##### Resultado Esperado

```
| first_name | last_name | email               |
|------------|-----------|---------------------|
| Mariana    | Góes      | mariana@meu_email.com|
| Cristiano  | Almeida   | cristiano@usuario.com|
| Carol      | Bueno     | carol@meu_email.com  |
| Mariana    | Rosa      | mariana@usuario.com  |
| Marta      | Jesus     | null                |
```

### Conclusão

- **DISTINCT**: Usado para selecionar valores únicos de uma coluna, eliminando duplicatas.
- **LIMIT**: Usado para restringir o número de registros retornados pela consulta, útil para paginar resultados ou obter uma amostra dos dados.

As queries fornecidas demonstram como esses comandos são usados para obter resultados específicos de tabelas de dados, garantindo que apenas os valores desejados sejam retornados.