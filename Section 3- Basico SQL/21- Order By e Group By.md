### Explicação de ORDER BY e GROUP BY em SQL

**ORDER BY**:
- O comando `ORDER BY` é usado para classificar os resultados de uma consulta SQL em ordem ascendente (ASC) ou descendente (DESC) com base em uma ou mais colunas.
- Por padrão, se nenhuma ordem for especificada, a classificação será em ordem ascendente.

**Exemplo de `ORDER BY`**:
```sql
-- Seleciona todas as colunas da tabela orders e ordena os resultados pela coluna created_at em ordem crescente
SELECT *
FROM orders
ORDER BY created_at ASC;

-- Seleciona todas as colunas da tabela orders e ordena os resultados pela coluna created_at em ordem decrescente
SELECT *
FROM orders
ORDER BY created_at DESC;
```

**GROUP BY**:
- O comando `GROUP BY` é usado para agrupar linhas que têm valores iguais em colunas especificadas em conjuntos de resumo, como calcular somas, contagens, médias, etc.
- É frequentemente usado com funções de agregação como COUNT, SUM, AVG, MAX, MIN.

**Exemplo de `GROUP BY`**:
```sql
-- Conta o número de pedidos (orders) por status e retorna o status e a contagem
SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

-- Conta o número de pedidos (orders) por customer_id e retorna o customer_id e a contagem
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;
```

### Aplicando `ORDER BY` e `GROUP BY` na Tabela `orders`

#### Tabela `orders`:
```sql
id | created_at              | customer_id | status
---|-------------------------|-------------|--------
1  | 2019-10-30 11:47:36 UTC | 0           | carrinho
2  | 2019-02-20 04:18:16 UTC | 0           | carrinho
3  | 2019-07-20 09:39:59 UTC | 0           | carrinho
4  | 2019-09-08 05:02:58 UTC | 0           | carrinho
5  | 2019-06-17 22:27:25 UTC | 0           | carrinho
6  | 2019-06-09 13:40:01 UTC | 0           | carrinho
7  | 2019-10-01 03:20:22 UTC | 0           | carrinho
8  | 2019-12-11 09:51:14 UTC | 0           | carrinho
9  | 2019-05-03 06:50:47 UTC | 0           | carrinho
10 | 2019-12-03 14:58:51 UTC | 0           | carrinho
```

**Exemplo de `ORDER BY`**:
1. Ordenando pedidos pela data de criação em ordem crescente:
    ```sql
    -- Seleciona todas as colunas da tabela orders e ordena os resultados pela coluna created_at em ordem crescente
    SELECT *
    FROM orders
    ORDER BY created_at ASC;
    ```

    **Resultado**:
    ```
    id | created_at              | customer_id | status
    ---|-------------------------|-------------|--------
    2  | 2019-02-20 04:18:16 UTC | 0           | carrinho
    9  | 2019-05-03 06:50:47 UTC | 0           | carrinho
    6  | 2019-06-09 13:40:01 UTC | 0           | carrinho
    5  | 2019-06-17 22:27:25 UTC | 0           | carrinho
    3  | 2019-07-20 09:39:59 UTC | 0           | carrinho
    4  | 2019-09-08 05:02:58 UTC | 0           | carrinho
    7  | 2019-10-01 03:20:22 UTC | 0           | carrinho
    1  | 2019-10-30 11:47:36 UTC | 0           | carrinho
    10 | 2019-12-03 14:58:51 UTC | 0           | carrinho
    8  | 2019-12-11 09:51:14 UTC | 0           | carrinho
    ```

2. Ordenando pedidos pela data de criação em ordem decrescente:
    ```sql
    -- Seleciona todas as colunas da tabela orders e ordena os resultados pela coluna created_at em ordem decrescente
    SELECT *
    FROM orders
    ORDER BY created_at DESC;
    ```

    **Resultado**:
    ```
    id | created_at              | customer_id | status
    ---|-------------------------|-------------|--------
    8  | 2019-12-11 09:51:14 UTC | 0           | carrinho
    10 | 2019-12-03 14:58:51 UTC | 0           | carrinho
    1  | 2019-10-30 11:47:36 UTC | 0           | carrinho
    7  | 2019-10-01 03:20:22 UTC | 0           | carrinho
    4  | 2019-09-08 05:02:58 UTC | 0           | carrinho
    3  | 2019-07-20 09:39:59 UTC | 0           | carrinho
    5  | 2019-06-17 22:27:25 UTC | 0           | carrinho
    6  | 2019-06-09 13:40:01 UTC | 0           | carrinho
    9  | 2019-05-03 06:50:47 UTC | 0           | carrinho
    2  | 2019-02-20 04:18:16 UTC | 0           | carrinho
    ```

**Exemplo de `GROUP BY`**:
1. Contando o número de pedidos por status:
    ```sql
    -- Conta o número de pedidos (orders) por status e retorna o status e a contagem
    SELECT status, COUNT(*) AS total_orders
    FROM orders
    GROUP BY status;
    ```

    **Resultado**:
    ```
    status   | total_orders
    ---------|--------------
    carrinho | 10
    ```

2. Contando o número de pedidos por customer_id:
    ```sql
    -- Conta o número de pedidos (orders) por customer_id e retorna o customer_id e a contagem
    SELECT customer_id, COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id;
    ```

    **Resultado**:
    ```
    customer_id | total_orders
    ------------|--------------
    0           | 10
    ```

Esses exemplos mostram como utilizar `ORDER BY` para ordenar os resultados e `GROUP BY` para agrupar resultados em subconjuntos, permitindo assim executar funções de agregação como contagens, somas, médias, etc.