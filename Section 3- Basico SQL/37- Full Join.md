# Full Join

O `FULL JOIN` (ou `FULL OUTER JOIN`) em SQL é uma cláusula utilizada para combinar registros de duas tabelas. Ele retorna todos os registros quando há uma correspondência em uma das tabelas. Se não houver correspondência, os resultados serão preenchidos com `NULL` para a tabela que não tem correspondência.

### Estrutura Básica do `FULL JOIN`

A sintaxe geral para um `FULL JOIN` é:

```sql
SELECT colunas
FROM tabela1
FULL JOIN tabela2
ON tabela1.coluna_comum = tabela2.coluna_comum;
```

### Exemplo Prático

Vamos supor que temos duas tabelas: `Clientes` e `Pedidos`.

#### Tabela Clientes

| ClienteID | Nome     |
|-----------|----------|
| 1         | Ana      |
| 2         | João     |
| 3         | Maria    |

#### Tabela Pedidos

| PedidoID | ClienteID | Produto    |
|----------|-----------|------------|
| 101      | 1         | Computador |
| 102      | 2         | Impressora |
| 103      | 4         | Teclado    |

### Utilizando `FULL JOIN`

Queremos listar todos os clientes e pedidos, mesmo se alguns pedidos não tiverem correspondência com clientes e vice-versa.

```sql
SELECT 
  Clientes.ClienteID, 
  Clientes.Nome, 
  Pedidos.PedidoID, 
  Pedidos.Produto 
FROM 
  Clientes
FULL JOIN 
  Pedidos 
ON 
  Clientes.ClienteID = Pedidos.ClienteID;
```

#### Resultado

| ClienteID | Nome  | PedidoID | Produto    |
|-----------|-------|----------|------------|
| 1         | Ana   | 101      | Computador |
| 2         | João  | 102      | Impressora |
| 3         | Maria | NULL     | NULL       |
| NULL      | NULL  | 103      | Teclado    |

### Explicação

1. **Combinação de Registros**:
   - O registro com `ClienteID` 1 (`Ana`) é combinado com o `PedidoID` 101 (`Computador`).
   - O registro com `ClienteID` 2 (`João`) é combinado com o `PedidoID` 102 (`Impressora`).
   - O registro com `ClienteID` 3 (`Maria`) não tem correspondência na tabela `Pedidos`, então os campos `PedidoID` e `Produto` aparecem como `NULL`.
   - O registro com `PedidoID` 103 (`Teclado`) não tem correspondência na tabela `Clientes`, então os campos `ClienteID` e `Nome` aparecem como `NULL`.

2. **Inclusão de Registros Não Correspondentes**:
   - Todos os registros de ambas as tabelas são incluídos, mesmo quando não há correspondência.

### Comparação com Outros JOINs

- **INNER JOIN**: Retorna apenas os registros que têm correspondência em ambas as tabelas.
- **LEFT JOIN**: Retorna todos os registros da tabela à esquerda (left table) e os registros correspondentes da tabela à direita. Se não houver correspondência, os resultados da tabela à direita serão `NULL`.
- **RIGHT JOIN**: Retorna todos os registros da tabela à direita (right table) e os registros correspondentes da tabela à esquerda. Se não houver correspondência, os resultados da tabela à esquerda serão `NULL`.
- **FULL JOIN**: Retorna todos os registros quando há uma correspondência em uma das tabelas. Se não houver correspondência, os resultados serão preenchidos com `NULL` para a tabela que não tem correspondência.

### Conclusão

O `FULL JOIN` é útil quando queremos garantir que todos os registros de ambas as tabelas sejam incluídos no resultado, independentemente de haver ou não correspondências. Isso pode ser particularmente útil em relatórios e análises onde é importante considerar todos os dados disponíveis, mesmo aqueles que não têm uma correspondência direta.