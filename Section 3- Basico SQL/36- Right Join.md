Vamos analisar e explicar cada uma das consultas SQL em detalhes.

### Primeira Consulta

```sql
SELECT
  DISTINCT a.user_id AS table_acessos,                             
  c.user_id AS table_compras, 
  c.name,           
  c.revenue                            
FROM
  relationship.acessos AS a
RIGHT JOIN            
  relationship.compras AS c          
ON
  a.user_id = c.user_id;
```

#### Explicação
1. **SELECT DISTINCT**: Seleciona registros únicos (distintos) com base nas colunas especificadas.
2. **Colunas Selecionadas**:
   - `a.user_id AS table_acessos`: O `user_id` da tabela `acessos`, com o alias `table_acessos`.
   - `c.user_id AS table_compras`: O `user_id` da tabela `compras`, com o alias `table_compras`.
   - `c.name`: O nome do usuário da tabela `compras`.
   - `c.revenue`: A receita associada ao usuário da tabela `compras`.
3. **FROM relationship.acessos AS a**: Define a tabela `acessos` com o alias `a`.
4. **RIGHT JOIN relationship.compras AS c**: Combina a tabela `acessos` com a tabela `compras`, usando o alias `c`. O `RIGHT JOIN` garante que todos os registros da tabela `compras` serão retornados, mesmo que não haja correspondência na tabela `acessos`.
5. **ON a.user_id = c.user_id**: Especifica a condição de junção, que é a correspondência de `user_id` entre as duas tabelas.

#### Resultado
Esta consulta retorna todos os registros da tabela `compras` e os registros correspondentes da tabela `acessos`. Se um `user_id` não existir na tabela `acessos`, o campo `table_acessos` será `NULL`.

### Segunda Consulta

```sql
SELECT
  DISTINCT a.user_id AS table_acessos,                             
  c.user_id AS table_compras, 
  c.name,           
  c.revenue                            
FROM
  relationship.acessos AS a
RIGHT JOIN            
  relationship.compras AS c          
ON
  a.user_id = c.user_id
WHERE 
  a.user_id IS NULL;
```

#### Explicação
Esta consulta é similar à primeira, mas inclui uma cláusula `WHERE` adicional.

- **WHERE a.user_id IS NULL**: Filtra os resultados para incluir apenas os registros onde `user_id` da tabela `acessos` é `NULL`.

#### Resultado
Esta consulta retorna todos os registros da tabela `compras` que não têm correspondência na tabela `acessos`. Basicamente, ela mostra os usuários que fizeram compras (`compras`), mas que não estão registrados nos acessos (`acessos`).

### Terceira Consulta

```sql
SELECT
  DISTINCT a.user_id AS table_acessos,                             
  c.user_id AS table_compras, 
  c.name,           
  c.revenue                            
FROM
  relationship.acessos AS a
RIGHT JOIN            
  relationship.compras AS c          
ON
  a.user_id = c.user_id
WHERE 
  a.user_id IS NOT NULL;
```

#### Explicação
Novamente, esta consulta é similar à primeira, mas com uma cláusula `WHERE` diferente.

- **WHERE a.user_id IS NOT NULL**: Filtra os resultados para incluir apenas os registros onde `user_id` da tabela `acessos` não é `NULL`.

#### Resultado
Esta consulta retorna todos os registros da tabela `compras` que têm correspondência na tabela `acessos`. Ou seja, ela mostra os usuários que fizeram compras (`compras`) e que também têm registros de acessos (`acessos`).

### Resumo das Consultas

1. **Primeira Consulta**: Retorna todos os registros de compras e os correspondentes de acessos, mostrando `NULL` para acessos se não houver correspondência.
2. **Segunda Consulta**: Retorna registros de compras sem correspondência na tabela de acessos.
3. **Terceira Consulta**: Retorna registros de compras que têm correspondência na tabela de acessos.

Essas consultas ajudam a entender a relação entre acessos e compras, identificando usuários que fizeram compras mas não acessaram, assim como aqueles que fizeram ambas as ações.