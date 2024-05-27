Vamos explicar este código SQL detalhadamente. Ele usa Common Table Expressions (CTEs) para calcular contagens distintas de `customer_id` e `id` em uma tabela chamada `testing.orders`, agrupadas por data (`created_at`). Em seguida, combina os resultados dessas CTEs para obter uma visão consolidada das métricas diárias.

### Estrutura do Código

#### 1. Definição das CTEs

**CTE `table1`**:
```sql
WITH table1 AS (
  SELECT
    COUNT(DISTINCT customer_id) AS compradores,
    DATE(created_at) AS dia
  FROM testing.orders
  GROUP BY 2
),
```
- **Propósito**: Contar o número distinto de `customer_id` (compradores) para cada dia.
- **Colunas**:
  - `compradores`: Número de clientes distintos que fizeram pedidos.
  - `dia`: Data dos pedidos (usando `DATE(created_at)` para extrair a data).

**CTE `table2`**:
```sql
table2 AS (
  SELECT 
    COUNT(DISTINCT id) AS compras,
    DATE(created_at) AS dia
  FROM testing.orders
  GROUP BY 2
)
```
- **Propósito**: Contar o número distinto de `id` (compras) para cada dia.
- **Colunas**:
  - `compras`: Número de pedidos distintos.
  - `dia`: Data dos pedidos (usando `DATE(created_at)` para extrair a data).

#### 2. Consulta Principal

**Consulta que combina as CTEs**:
```sql
SELECT 
  compradores, 
  compras, 
  a.dia
FROM table1 AS a
JOIN table2 AS b ON a.dia = b.dia
WHERE a.dia BETWEEN '2020-01-01' AND '2020-01-31'
ORDER BY 3 ASC;
```
- **Combinação das Tabelas (JOIN)**:
  - Realiza um `JOIN` entre `table1` e `table2` na coluna `dia`, combinando as métricas diárias de ambas as CTEs.

- **Cláusula `WHERE`**:
  - Filtra os resultados para incluir apenas os dias entre `2020-01-01` e `2020-01-31`.

- **Cláusula `ORDER BY`**:
  - Ordena os resultados pela coluna `dia` em ordem ascendente.

### Explicação dos Elementos

1. **CTEs**:
   - **`WITH`**: Define CTEs que podem ser usadas na consulta principal.
   - **`table1`**: Calcula o número de compradores distintos por dia.
   - **`table2`**: Calcula o número de compras distintas por dia.

2. **Consulta Principal**:
   - **`SELECT`**: Escolhe as colunas `compradores`, `compras` e `dia` para serem exibidas.
   - **`FROM`**: Especifica que os dados vêm de `table1` e `table2`.
   - **`JOIN`**: Une as CTEs `table1` e `table2` na coluna `dia`, garantindo que apenas as datas comuns a ambas as CTEs sejam consideradas.
   - **`WHERE`**: Restringe os resultados às datas entre `2020-01-01` e `2020-01-31`.
   - **`ORDER BY`**: Ordena os resultados pela data (`dia`) em ordem ascendente.

### Erros Corrigidos

- **Aspas Simples**: Para valores de data, use aspas simples (`'`) em vez de aspas duplas (`"`).
- **Consistência de Nomes de Colunas**: As colunas devem ter nomes consistentes (use `dia` em ambos os CTEs).

### Versão Corrigida

```sql
WITH table1 AS (
  SELECT
    COUNT(DISTINCT customer_id) AS compradores,
    DATE(created_at) AS dia
  FROM testing.orders
  GROUP BY DATE(created_at)
),

table2 AS (
  SELECT 
    COUNT(DISTINCT id) AS compras,
    DATE(created_at) AS dia
  FROM testing.orders
  GROUP BY DATE(created_at)
)

SELECT 
  table1.compradores, 
  table2.compras, 
  table1.dia
FROM table1
JOIN table2 ON table1.dia = table2.dia
WHERE table1.dia BETWEEN '2020-01-01' AND '2020-01-31'
ORDER BY table1.dia ASC;
```

Esta consulta agora deve funcionar corretamente, calculando e exibindo o número de compradores e compras por dia, apenas para os dias dentro de janeiro de 2020, ordenados por data.