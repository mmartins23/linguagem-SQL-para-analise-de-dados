Vamos analisar e explicar detalhadamente cada uma das quatro consultas SQL. Essas consultas fazem uso de `FULL JOIN` para combinar registros de várias tabelas, considerando todas as possíveis combinações, mesmo quando não há correspondência entre os registros.

### Primeira Consulta

```sql
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,
  a.name AS name_tabela_a,
  c.user_id AS user_id_tabela_c,
  c.name AS name_tabela_c
FROM
  relationship.acessos a
FULL JOIN
  relationship.compras c
ON
  a.user_id = c.user_id;
```

#### Explicação

1. **SELECT DISTINCT**: Seleciona registros únicos (distintos) com base nas colunas especificadas.
2. **Colunas Selecionadas**:
   - `a.user_id AS user_id_tabela_a`: O `user_id` da tabela `acessos`, com o alias `user_id_tabela_a`.
   - `a.name AS name_tabela_a`: O `name` da tabela `acessos`, com o alias `name_tabela_a`.
   - `c.user_id AS user_id_tabela_c`: O `user_id` da tabela `compras`, com o alias `user_id_tabela_c`.
   - `c.name AS name_tabela_c`: O `name` da tabela `compras`, com o alias `name_tabela_c`.
3. **FROM relationship.acessos a**: Define a tabela `acessos` com o alias `a`.
4. **FULL JOIN relationship.compras c**: Combina a tabela `acessos` com a tabela `compras`, garantindo que todos os registros de ambas as tabelas sejam incluídos.
5. **ON a.user_id = c.user_id**: Especifica a condição de junção, que é a correspondência de `user_id` entre as duas tabelas.

#### Resultado
A consulta retorna todos os registros de ambas as tabelas, `acessos` e `compras`. Se um `user_id` não existir em uma das tabelas, os campos dessa tabela serão preenchidos com `NULL`.

### Segunda Consulta

```sql
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,
  a.name AS name_tabela_a,
  c.user_id AS user_id_tabela_c,
  c.name AS name_tabela_c
FROM
  relationship.acessos a
FULL JOIN
  relationship.compras c
ON
  a.user_id = c.user_id
WHERE
  a.user_id IS NULL
  OR c.user_id IS NULL;
```

#### Explicação

1. **SELECT DISTINCT**: Seleciona registros únicos (distintos) com base nas colunas especificadas.
2. **Colunas Selecionadas**:
   - `a.user_id AS user_id_tabela_a`
   - `a.name AS name_tabela_a`
   - `c.user_id AS user_id_tabela_c`
   - `c.name AS name_tabela_c`
3. **FROM relationship.acessos a**
4. **FULL JOIN relationship.compras c**
5. **ON a.user_id = c.user_id**
6. **WHERE a.user_id IS NULL OR c.user_id IS NULL**: Filtra os resultados para incluir apenas os registros onde `user_id` é `NULL` em pelo menos uma das tabelas.

#### Resultado
A consulta retorna registros onde há `user_id` em apenas uma das tabelas (`acessos` ou `compras`), ou seja, registros que não têm correspondência na outra tabela.

### Terceira Consulta

```sql
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,
  a.name AS name_tabela_a,
  c.user_id AS user_id_tabela_c,
  c.name AS name_tabela_c,
  u.id AS user_id_tabela_u,
  u.name AS name_tabela_u
FROM
  relationship.acessos a
FULL JOIN
  relationship.compras c
ON
  a.user_id = c.user_id
FULL JOIN
  relationship.usuarios u
ON
  COALESCE(a.user_id, c.user_id) = u.id;
```

#### Explicação

1. **SELECT DISTINCT**: Seleciona registros únicos (distintos) com base nas colunas especificadas.
2. **Colunas Selecionadas**:
   - `a.user_id AS user_id_tabela_a`
   - `a.name AS name_tabela_a`
   - `c.user_id AS user_id_tabela_c`
   - `c.name AS name_tabela_c`
   - `u.id AS user_id_tabela_u`: O `id` da tabela `usuarios`, com o alias `user_id_tabela_u`.
   - `u.name AS name_tabela_u`: O `name` da tabela `usuarios`, com o alias `name_tabela_u`.
3. **FROM relationship.acessos a**
4. **FULL JOIN relationship.compras c**
5. **ON a.user_id = c.user_id**
6. **FULL JOIN relationship.usuarios u**: Adiciona outra junção completa com a tabela `usuarios`.
7. **ON COALESCE(a.user_id, c.user_id) = u.id**: Utiliza a função `COALESCE` para combinar os `user_id` de `acessos` e `compras`, correspondendo-os com o `id` da tabela `usuarios`.

#### Resultado
A consulta retorna todos os registros de `acessos`, `compras` e `usuarios`, combinando os registros com base no `user_id` de `acessos` ou `compras` com o `id` de `usuarios`. Se não houver correspondência, os campos das tabelas não correspondentes serão `NULL`.

### Quarta Consulta

```sql
SELECT
  DISTINCT a.user_id AS user_id_tabela_a,
  a.name AS name_tabela_a,
  c.user_id AS user_id_tabela_c,
  c.name AS name_tabela_c,
  u.id AS user_id_tabela_u,
  u.name AS name_tabela_u
FROM
  relationship.acessos a
FULL JOIN
  relationship.compras c
ON
  a.user_id = c.user_id
FULL JOIN
  relationship.usuarios u
ON
  COALESCE(a.user_id, c.user_id) = u.id
WHERE
  COALESCE(a.user_id, c.user_id) IS NULL;
```

#### Explicação

1. **SELECT DISTINCT**: Seleciona registros únicos (distintos) com base nas colunas especificadas.
2. **Colunas Selecionadas**:
   - `a.user_id AS user_id_tabela_a`
   - `a.name AS name_tabela_a`
   - `c.user_id AS user_id_tabela_c`
   - `c.name AS name_tabela_c`
   - `u.id AS user_id_tabela_u`
   - `u.name AS name_tabela_u`
3. **FROM relationship.acessos a**
4. **FULL JOIN relationship.compras c**
5. **ON a.user_id = c.user_id**
6. **FULL JOIN relationship.usuarios u**
7. **ON COALESCE(a.user_id, c.user_id) = u.id**
8. **WHERE COALESCE(a.user_id, c.user_id) IS NULL**: Filtra os resultados para incluir apenas os registros onde `user_id` é `NULL` em ambas as tabelas `acessos` e `compras`.

#### Resultado
A consulta retorna registros de `usuarios` que não têm correspondência em nenhuma das tabelas `acessos` ou `compras`. Ou seja, mostra usuários que não estão registrados nem em acessos nem em compras.

### Resumo das Consultas

1. **Primeira Consulta**: Retorna todos os registros de `acessos` e `compras`, com `NULL` preenchido onde não há correspondência.
2. **Segunda Consulta**: Retorna registros de `acessos` ou `compras` que não têm correspondência na outra tabela.
3. **Terceira Consulta**: Retorna todos os registros de `acessos`, `compras` e `usuarios`, combinando os `user_id` com `id` de `usuarios`.
4. **Quarta Consulta**: Retorna registros de `usuarios` que não têm correspondência em nenhuma das tabelas `acessos` ou `compras`.