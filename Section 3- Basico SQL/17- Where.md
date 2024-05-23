A cláusula WHERE em SQL é usada para filtrar linhas de uma consulta com base em uma condição especificada. Ela permite selecionar apenas as linhas que atendem aos critérios especificados na condição. Aqui estão os exemplos fornecidos com uma explicação de cada um:

1. **Exemplo 1**:
```sql
SELECT * 
FROM testing.items 
WHERE quantity = 1;
```
Este exemplo seleciona todas as colunas da tabela "testing.items" onde a coluna "quantity" é igual a 1. Isso retornará todas as linhas onde o valor da quantidade é exatamente 1.

2. **Exemplo 2**:
```sql
SELECT * 
FROM testing.customers 
WHERE state = "Bahia" AND email IS NOT NULL;
```
Neste exemplo, estamos selecionando todas as colunas da tabela "testing.customers" onde o estado é "Bahia" e o endereço de e-mail não é nulo. Isso retornará todas as linhas de clientes que estão localizadas na Bahia e têm um endereço de e-mail válido.

3. **Exemplo 3**:
```sql
SELECT * 
FROM testing.customers 
WHERE (state = "Bahia" OR state = "Acre") AND email IS NOT NULL;
```
Este exemplo é semelhante ao anterior, mas com uma condição adicional. Ele seleciona todas as colunas da tabela "testing.customers" onde o estado é "Bahia" ou "Acre" e o endereço de e-mail não é nulo. Isso retornará todas as linhas de clientes que estão localizadas na Bahia ou no Acre e têm um endereço de e-mail válido.

Esses exemplos demonstram como a cláusula WHERE é usada para filtrar os resultados de uma consulta com base em critérios específicos.