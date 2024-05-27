# Right Join

![Right Join](https://www.w3schools.com/sql/img_right_join.png)

O `RIGHT JOIN` em SQL é uma cláusula utilizada para combinar registros de duas tabelas. Ele retorna todos os registros da tabela à direita (right table) e os registros correspondentes da tabela à esquerda (left table). Se não houver correspondência, os resultados da tabela à esquerda serão nulos. Vamos ver isso com um exemplo básico.

### Estrutura básica do `RIGHT JOIN`

A sintaxe geral para um `RIGHT JOIN` é:

```sql
SELECT colunas
FROM tabela1
RIGHT JOIN tabela2
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

### Utilizando `RIGHT JOIN`

Queremos listar todos os pedidos e os nomes dos clientes, mesmo se alguns pedidos não tiverem correspondência com clientes na tabela `Clientes`. Isso seria feito assim:

```sql
SELECT Pedidos.PedidoID, Pedidos.Produto, Clientes.Nome
FROM Clientes
RIGHT JOIN Pedidos
ON Clientes.ClienteID = Pedidos.ClienteID;
```

#### Resultado
| PedidoID | Produto    | Nome  |
|----------|------------|-------|
| 101      | Computador | Ana   |
| 102      | Impressora | João  |
| 103      | Teclado    | NULL  |

### Explicação

- O `RIGHT JOIN` retorna todos os registros da tabela `Pedidos` (tabela à direita).
- Para os registros da tabela `Pedidos` que têm correspondência na tabela `Clientes` (baseado no `ClienteID`), ele retorna o nome do cliente.
- Para o pedido com `PedidoID` 103, não há correspondência na tabela `Clientes` (não existe `ClienteID` 4 na tabela `Clientes`), então o campo `Nome` aparece como `NULL`.

### Comparando com Outros JOINs

- `INNER JOIN`: Retorna apenas os registros com correspondência em ambas as tabelas.
- `LEFT JOIN` (ou `LEFT OUTER JOIN`): Retorna todos os registros da tabela à esquerda (left table) e os registros correspondentes da tabela à direita. Se não houver correspondência, os resultados da tabela à direita serão nulos.
- `RIGHT JOIN` (ou `RIGHT OUTER JOIN`): Retorna todos os registros da tabela à direita (right table) e os registros correspondentes da tabela à esquerda. Se não houver correspondência, os resultados da tabela à esquerda serão nulos.

### Conclusão

O `RIGHT JOIN` é útil quando queremos garantir que todos os registros da tabela à direita sejam incluídos no resultado, independentemente de haver ou não correspondências na tabela à esquerda. É importante entender o comportamento dos diferentes tipos de `JOIN` para poder escolher o mais adequado para a consulta que você precisa fazer.