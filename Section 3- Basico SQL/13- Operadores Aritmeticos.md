# Operadores Aritméticos

Em SQL, os operadores aritméticos são usados para realizar operações matemáticas em valores numéricos armazenados nas colunas de uma tabela. Esses operadores permitem executar adições, subtrações, multiplicações e divisões diretamente em consultas SQL.

Aqui estão os operadores aritméticos básicos em SQL:

1. **Adição (+)**: Usado para somar valores.
2. **Subtração (-)**: Usado para subtrair valores.
3. **Multiplicação (*)**: Usado para multiplicar valores.
4. **Divisão (/)**: Usado para dividir valores.

Esses operadores podem ser utilizados em consultas SELECT, UPDATE e em outras cláusulas SQL para realizar cálculos matemáticos em valores numéricos.

***

### Exemplos

1. **Adição (+)**: Suponha que você queira encontrar o preço total de um sapato e uma bolsa. Você pode fazer isso adicionando os preços desses itens:

```sql
SELECT
  (
  SELECT
    price
  FROM
    testing.products
  WHERE
    name = 'Sapato') + (
  SELECT
    price
  FROM
    testing.products
  WHERE
    name = 'Bolsa') AS total_price;
```

Isso retornará o preço total somado do sapato e da bolsa.

2. **Subtração (-)**: Digamos que você queira encontrar a diferença de preço entre uma calça e uma camisa:

```sql
SELECT
  (
  SELECT
    price
  FROM
    testing.products
  WHERE
    name = 'Calça') - (
  SELECT
    price
  FROM
    testing.products
  WHERE
    name = 'Camisa') AS price_difference;
```

Isso calculará a diferença de preço entre a calça e a camisa.

Esses são exemplos de como você pode usar os operadores aritméticos em SQL com a tabela "Row" para realizar operações matemáticas em valores específicos ou atualizar valores existentes.
