# INNER JOIN

![Inner Join](https://www.w3schools.com/sql/img_innerjoin.gif)

O `INNER JOIN` (ou simplesmente `JOIN`) é usado em SQL para combinar registros de duas ou mais tabelas com base em uma condição de correspondência. Ele retorna apenas as linhas em que há uma correspondência em ambas as tabelas envolvidas na junção.

### Sintaxe Básica

```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
```

### Exemplos

#### Exemplo 1: Junção Simples

Considere duas tabelas, `employees` e `departments`:

```sql
-- employees
+----+---------+-------------+
| id | name    | department_id|
+----+---------+-------------+
| 1  | Alice   | 1           |
| 2  | Bob     | 2           |
| 3  | Charlie | 1           |
+----+---------+-------------+

-- departments
+----+-------------+
| id | dept_name   |
+----+-------------+
| 1  | HR          |
| 2  | Engineering |
+----+-------------+
```

Para combinar estas tabelas e obter os nomes dos funcionários com os nomes de seus departamentos:

```sql
SELECT employees.name, departments.dept_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;
```

**Resultado:**

```sql
+---------+-------------+
| name    | dept_name   |
+---------+-------------+
| Alice   | HR          |
| Bob     | Engineering |
| Charlie | HR          |
+---------+-------------+
```

#### Exemplo 2: Junção com Mais Condições

Se quisermos adicionar mais condições ao `JOIN`, podemos fazer isso facilmente. Vamos adicionar uma tabela `salaries`:

```sql
-- salaries
+----+----------+--------+
| id | emp_id   | salary |
+----+----------+--------+
| 1  | 1        | 50000  |
| 2  | 2        | 60000  |
| 3  | 3        | 55000  |
+----+----------+--------+
```

Para obter os nomes dos funcionários, os nomes de seus departamentos e seus salários:

```sql
SELECT employees.name, departments.dept_name, salaries.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id
INNER JOIN salaries
ON employees.id = salaries.emp_id;
```

**Resultado:**

```sql
+---------+-------------+--------+
| name    | dept_name   | salary |
+---------+-------------+--------+
| Alice   | HR          | 50000  |
| Bob     | Engineering | 60000  |
| Charlie | HR          | 55000  |
+---------+-------------+--------+
```

#### Exemplo 3: Junção em Colunas Diferentes

Às vezes, as colunas de junção não têm o mesmo nome. Vamos considerar duas tabelas:

```sql
-- orders
+----+---------+------------+
| id | order_no| customer_id|
+----+---------+------------+
| 1  | 1001    | 1          |
| 2  | 1002    | 2          |
| 3  | 1003    | 3          |
+----+---------+------------+

-- customers
+----+---------+--------+
| id | name    | cust_id|
+----+---------+--------+
| 1  | John    | 1      |
| 2  | Jane    | 2      |
| 3  | Jack    | 3      |
+----+---------+--------+
```

Para combinar estas tabelas:

```sql
SELECT orders.order_no, customers.name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.cust_id;
```

**Resultado:**

```sql
+---------+------+
| order_no| name |
+---------+------+
| 1001    | John |
| 1002    | Jane |
| 1003    | Jack |
+---------+------+
```

### Explicação Adicional

- **INNER JOIN** retorna apenas as linhas onde há correspondência em ambas as tabelas.
- Se não houver correspondência em uma das tabelas, essas linhas não serão incluídas no resultado.
- `INNER JOIN` é a junção mais comum e geralmente é o que se entende quando alguém se refere a um `JOIN`.

O `INNER JOIN` é poderoso para relacionar dados entre tabelas, permitindo que você crie consultas complexas que combinam informações de várias tabelas de maneira eficiente.