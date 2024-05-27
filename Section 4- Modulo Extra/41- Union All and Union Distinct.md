### Explicação das Queries

#### Primeira Query: `UNION ALL`

```sql
SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 1 AND 5

UNION ALL

SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 4 AND 6

ORDER BY id;
```

**Explicação**:

1. **Primeira Parte**: Seleciona registros da tabela `testing.customers` onde `id` está entre 1 e 5.
2. **Segunda Parte**: Seleciona registros da tabela `testing.customers` onde `id` está entre 4 e 6.
3. **`UNION ALL`**: Combina os resultados dos dois `SELECTs`, mantendo todas as duplicatas.
4. **`ORDER BY id`**: Ordena os resultados combinados pelo `id`.

**Resultado JSON**:
```json
[
  { "id": "1", "first_name": "Luana", "last_name": "Almeida" },
  { "id": "2", "first_name": "Frida", "last_name": "Mendes" },
  { "id": "3", "first_name": "Daniela", "last_name": "Avelino" },
  { "id": "4", "first_name": "Romário", "last_name": "Teixeira" },
  { "id": "4", "first_name": "Romário", "last_name": "Teixeira" },
  { "id": "5", "first_name": "Marcelo", "last_name": "Barroso" },
  { "id": "5", "first_name": "Marcelo", "last_name": "Barroso" },
  { "id": "6", "first_name": "Cristiano", "last_name": "Elísio" }
]
```

**Resultado em Tabela**:

| id  | first_name | last_name  |
|-----|------------|------------|
| 1   | Luana      | Almeida    |
| 2   | Frida      | Mendes     |
| 3   | Daniela    | Avelino    |
| 4   | Romário    | Teixeira   |
| 4   | Romário    | Teixeira   |
| 5   | Marcelo    | Barroso    |
| 5   | Marcelo    | Barroso    |
| 6   | Cristiano  | Elísio     |

#### Segunda Query: `UNION DISTINCT`

```sql
SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 1 AND 5

UNION

SELECT
  id,
  first_name,
  last_name
FROM
  testing.customers
WHERE
  id BETWEEN 4 AND 6

ORDER BY id;
```

**Explicação**:

1. **Primeira Parte**: Seleciona registros da tabela `testing.customers` onde `id` está entre 1 e 5.
2. **Segunda Parte**: Seleciona registros da tabela `testing.customers` onde `id` está entre 4 e 6.
3. **`UNION`** (ou `UNION DISTINCT`): Combina os resultados dos dois `SELECTs` e remove todas as duplicatas.
4. **`ORDER BY id`**: Ordena os resultados combinados pelo `id`.

**Resultado JSON**:
```json
[
  { "id": "1", "first_name": "Luana", "last_name": "Almeida" },
  { "id": "2", "first_name": "Frida", "last_name": "Mendes" },
  { "id": "3", "first_name": "Daniela", "last_name": "Avelino" },
  { "id": "4", "first_name": "Romário", "last_name": "Teixeira" },
  { "id": "5", "first_name": "Marcelo", "last_name": "Barroso" },
  { "id": "6", "first_name": "Cristiano", "last_name": "Elísio" }
]
```

**Resultado em Tabela**:

| id  | first_name | last_name  |
|-----|------------|------------|
| 1   | Luana      | Almeida    |
| 2   | Frida      | Mendes     |
| 3   | Daniela    | Avelino    |
| 4   | Romário    | Teixeira   |
| 5   | Marcelo    | Barroso    |
| 6   | Cristiano  | Elísio     |

### Diferença entre `UNION ALL` e `UNION DISTINCT`

- **`UNION ALL`**: Combina os resultados e inclui todas as linhas de ambas as consultas, mantendo duplicatas.
- **`UNION DISTINCT`**: Combina os resultados e remove duplicatas. `UNION` é o mesmo que `UNION DISTINCT`.

### Considerações

- **`UNION ALL`** é mais rápido porque não precisa remover duplicatas.
- **`UNION DISTINCT`** é usado quando precisamos garantir que o resultado final não contenha duplicatas.

Esses exemplos ilustram claramente a diferença entre `UNION ALL` e `UNION` e mostram como os resultados são afetados pela inclusão ou exclusão de duplicatas.