# Union All e Union Distinct

Em SQL, `UNION` e `UNION ALL` são usados para combinar os resultados de duas ou mais consultas SQL. Embora ambos os comandos sejam semelhantes, há uma diferença crucial entre eles:

- `UNION` elimina duplicatas nos resultados combinados.
- `UNION ALL` mantém todas as duplicatas.

### UNION

O `UNION` combina os resultados de duas consultas, removendo duplicatas.

#### Sintaxe

```sql
SELECT coluna1, coluna2 FROM tabela1
UNION
SELECT coluna1, coluna2 FROM tabela2;
```

#### Exemplo

Considere duas tabelas simples, `TabelaA` e `TabelaB`:

**TabelaA**

| coluna1 | coluna2 |
|---------|---------|
| 1       | 'A'     |
| 2       | 'B'     |
| 3       | 'C'     |

**TabelaB**

| coluna1 | coluna2 |
|---------|---------|
| 2       | 'B'     |
| 3       | 'C'     |
| 4       | 'D'     |

#### Consulta usando `UNION`

```sql
SELECT coluna1, coluna2 FROM TabelaA
UNION
SELECT coluna1, coluna2 FROM TabelaB;
```

#### Resultado

| coluna1 | coluna2 |
|---------|---------|
| 1       | 'A'     |
| 2       | 'B'     |
| 3       | 'C'     |
| 4       | 'D'     |

Os valores duplicados (2, 'B' e 3, 'C') foram removidos.

### UNION ALL

O `UNION ALL` combina os resultados de duas consultas, mantendo todas as duplicatas.

#### Sintaxe

```sql
SELECT coluna1, coluna2 FROM tabela1
UNION ALL
SELECT coluna1, coluna2 FROM tabela2;
```

#### Exemplo

Usando as mesmas tabelas, `TabelaA` e `TabelaB`:

#### Consulta usando `UNION ALL`

```sql
SELECT coluna1, coluna2 FROM TabelaA
UNION ALL
SELECT coluna1, coluna2 FROM TabelaB;
```

#### Resultado

| coluna1 | coluna2 |
|---------|---------|
| 1       | 'A'     |
| 2       | 'B'     |
| 3       | 'C'     |
| 2       | 'B'     |
| 3       | 'C'     |
| 4       | 'D'     |

Os valores duplicados são mantidos.

### Diferença entre UNION e UNION ALL

- **UNION**: Remove duplicatas nos resultados combinados, o que pode levar a uma operação mais lenta devido ao trabalho adicional de eliminar duplicatas.
- **UNION ALL**: Inclui todas as linhas de ambas as consultas, incluindo duplicatas, resultando em uma operação mais rápida porque não há necessidade de eliminar duplicatas.

### Considerações de Uso

- **Use `UNION` quando precisar de resultados únicos**. É útil quando você deseja combinar resultados e garantir que não haja duplicatas.
- **Use `UNION ALL` quando precisar de todos os resultados, incluindo duplicatas**. É mais eficiente em termos de desempenho, pois não há sobrecarga de eliminação de duplicatas.

### Exemplos Práticos

#### Exemplo 1: `UNION`

```sql
SELECT 'Ana' AS Nome FROM DUAL
UNION
SELECT 'João' FROM DUAL
UNION
SELECT 'Ana' FROM DUAL;
```

#### Resultado

| Nome  |
|-------|
| Ana   |
| João  |

#### Exemplo 2: `UNION ALL`

```sql
SELECT 'Ana' AS Nome FROM DUAL
UNION ALL
SELECT 'João' FROM DUAL
UNION ALL
SELECT 'Ana' FROM DUAL;
```

#### Resultado

| Nome  |
|-------|
| Ana   |
| João  |
| Ana   |

Os exemplos ilustram claramente a diferença no comportamento em relação a duplicatas entre `UNION` e `UNION ALL`.