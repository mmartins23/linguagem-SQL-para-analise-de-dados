Os operadores de comparação em SQL são usados para comparar valores em consultas. Eles retornam verdadeiro (TRUE) se a comparação for avaliada como verdadeira e falso (FALSE) caso contrário. Vamos explicar cada operador com exemplos, usando a tabela fornecida.

### Operadores de Comparação em SQL:

1. **Igual (=)**: Verifica se dois valores são iguais.
2. **Diferente (!= ou <>)**: Verifica se dois valores são diferentes.
3. **Menor que (<)**: Verifica se um valor é menor que outro.
4. **Maior que (>)**: Verifica se um valor é maior que outro.
5. **Entre (BETWEEN)**: Verifica se um valor está dentro de um intervalo especificado.
6. **Como (LIKE)**: Usado para comparar padrões de strings usando caracteres curinga.
7. **Em (IN)**: Verifica se um valor está presente em um conjunto de valores.

Agora, vamos criar exemplos usando a tabela fornecida:

#### Exemplos:


1. **Igual (=)**: Selecione o produto com o nome "Sapato".

```sql
SELECT *
FROM products
WHERE name = 'Sapato';
```
**Saída:**
| id | name   | price | category_id |
|----|--------|-------|-------------|
| 1  | Sapato | 96    | 0           |

2. **Diferente (!= ou <>)**: Selecione todos os produtos exceto aqueles com preço igual a 70.

```sql
SELECT *
FROM products
WHERE price != 70;
```
**Saída:**
| id | name           | price | category_id |
|----|----------------|-------|-------------|
| 1  | Sapato         | 96    | 0           |
| 2  | Bolsa          | 21    | 0           |
| 3  | Calça          | 75    | 0           |
| 5  | Vestido        | 57    | 0           |
| 6  | Perfume        | 29    | 1           |
| 7  | Creme de Barbear | 15  | 1           |
| 8  | Hidratante     | 10    | 1           |
| 9  | Shampoo        | 15    | 1           |
| 10 | Protetor Solar | 11    | 1           |
| 11 | Geladeira      | 1952  | 2           |

3. **Menor que (<)**: Selecione todos os produtos com preço menor que 50.

```sql
SELECT *
FROM products
WHERE price < 50;
```
**Saída:**
| id | name           | price | category_id |
|----|----------------|-------|-------------|
| 2  | Bolsa          | 21    | 0           |
| 6  | Perfume        | 29    | 1           |
| 7  | Creme de Barbear | 15  | 1           |
| 8  | Hidratante     | 10    | 1           |
| 9  | Shampoo        | 15    | 1           |
| 10 | Protetor Solar | 11    | 1           |

4. **Maior que (>)**: Selecione todos os produtos com preço maior que 100.

```sql
SELECT *
FROM products
WHERE price > 100;
```
**Saída:**
| id | name      | price | category_id |
|----|-----------|-------|-------------|
| 11 | Geladeira | 1952  | 2           |

5. **Entre (BETWEEN)**: Selecione todos os produtos com preço entre 50 e 100.

```sql
SELECT *
FROM products
WHERE price BETWEEN 50 AND 100;
```
**Saída:**
| id | name    | price | category_id |
|----|---------|-------|-------------|
| 1  | Sapato  | 96    | 0           |
| 3  | Calça   | 75    | 0           |
| 5  | Vestido | 57    | 0           |

6. **Como (LIKE)**: Selecione todos os produtos que começam com a letra "P".

```sql
SELECT *
FROM products
WHERE name LIKE 'P%';
```
**Saída:**
| id | name           | price | category_id |
|----|----------------|-------|-------------|
| 10 | Protetor Solar | 11    | 1           |

7. **Em (IN)**: Selecione todos os produtos nas categorias 0 e 1.

```sql
SELECT *
FROM products
WHERE category_id IN (0, 1);
```
**Saída:**
| id | name           | price | category_id |
|----|----------------|-------|-------------|
| 1  | Sapato         | 96    | 0           |
| 2  | Bolsa          | 21    | 0           |
| 3  | Calça          | 75    | 0           |
| 4  | Camisa         | 70    | 0           |
| 5  | Vestido        | 57    | 0           |
| 6  | Perfume        | 29    | 1           |
| 7  | Creme de Barbear | 15  | 1           |
| 8  | Hidratante     | 10    | 1           |
| 9  | Shampoo        | 15    | 1           |
| 10 | Protetor Solar | 11    | 1           |

Esses são exemplos de consultas SQL com os operadores de comparação aplicados à tabela "products", junto com as saídas correspondentes retornadas pela consulta.