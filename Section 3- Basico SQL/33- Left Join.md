# Left Join

![Left Join](https://www.w3schools.com/sql/img_left_join.png)

O `LEFT JOIN` em SQL é utilizado para retornar todos os registros da tabela à esquerda (`left table`), e os registros correspondentes da tabehttps://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.w3schools.com%2Fsql%2Fsql_join_left.asp&psig=AOvVaw2aiVls8yWDTSgkhGthzyLQ&ust=1716648520757000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPCXnZzEpoYDFQAAAAAdAAAAABAKla à direita (`right table`). Se não houver correspondência, os resultados da tabela à direita serão NULL.

Aqui está a estrutura básica do `LEFT JOIN`:

```sql
SELECT columns
FROM left_table
LEFT JOIN right_table
ON left_table.common_column = right_table.common_column;
```

### Exemplo Básico

Vamos usar duas tabelas de exemplo: `customers` e `orders`.

#### Tabela `customers`

| customer_id | name     |
|-------------|----------|
| 1           | Alice    |
| 2           | Bob      |
| 3           | Charlie  |
| 4           | David    |

#### Tabela `orders`

| order_id | customer_id | amount |
|----------|-------------|--------|
| 101      | 1           | 250    |
| 102      | 2           | 150    |
| 103      | 2           | 300    |
| 104      | 3           | 500    |

### Exemplo de `LEFT JOIN`

Para listar todos os clientes e suas respectivas ordens (se houver), usamos o `LEFT JOIN`:

```sql
SELECT customers.customer_id, customers.name, orders.order_id, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```

### Resultado da Consulta

| customer_id | name    | order_id | amount |
|-------------|---------|----------|--------|
| 1           | Alice   | 101      | 250    |
| 2           | Bob     | 102      | 150    |
| 2           | Bob     | 103      | 300    |
| 3           | Charlie | 104      | 500    |
| 4           | David   | NULL     | NULL   |

### Explicação:

- **customer_id 1 (Alice)**: Alice tem uma ordem com `order_id 101` e `amount 250`.
- **customer_id 2 (Bob)**: Bob tem duas ordens (`order_id 102` e `order_id 103`), portanto, há duas linhas para Bob.
- **customer_id 3 (Charlie)**: Charlie tem uma ordem com `order_id 104` e `amount 500`.
- **customer_id 4 (David)**: David não tem ordens, então `order_id` e `amount` são `NULL`.

### Situações para Usar `LEFT JOIN`:

1. **Relatórios de Clientes**: Para listar todos os clientes, mesmo aqueles sem ordens.
2. **Auditoria de Dados**: Para verificar quais registros na tabela esquerda não têm correspondência na tabela direita.
3. **Análise de Completeness**: Para entender lacunas em dados, como clientes sem compras.

### Outro Exemplo:

#### Tabela `departments`

| department_id | department_name |
|---------------|-----------------|
| 1             | Sales           |
| 2             | Engineering     |
| 3             | HR              |

#### Tabela `employees`

| employee_id | name     | department_id |
|-------------|----------|---------------|
| 1           | John     | 1             |
| 2           | Jane     | 2             |
| 3           | Alice    | 2             |
| 4           | Bob      | 4             |

### Consulta:

```sql
SELECT departments.department_name, employees.name
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id;
```

### Resultado da Consulta:

| department_name | name  |
|-----------------|-------|
| Sales           | John  |
| Engineering     | Jane  |
| Engineering     | Alice |
| HR              | NULL  |

### Explicação:

- **Sales**: Tem um empregado chamado John.
- **Engineering**: Tem dois empregados, Jane e Alice.
- **HR**: Não tem empregados, então a coluna `name` é `NULL`.

O `LEFT JOIN` é muito útil quando você precisa garantir que todos os registros de uma tabela principal (esquerda) sejam incluídos na saída, independentemente de haver correspondências na tabela relacionada (direita).