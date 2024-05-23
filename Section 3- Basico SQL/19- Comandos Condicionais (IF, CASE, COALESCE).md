Os comandos condicionais em SQL permitem que você execute diferentes ações com base em condições específicas. Vou explicar cada um deles e, em seguida, fornecer uma explicação para os códigos fornecidos.

1. **CASE**:
   - O comando CASE é uma expressão condicional que permite avaliar uma série de condições e retornar um valor quando a primeira condição verdadeira é encontrada.
   - Sintaxe:
     ```
     CASE
       WHEN condition1 THEN result1
       WHEN condition2 THEN result2
       ...
       ELSE default_result
     END
     ```
   - Explicação: No código fornecido, a cláusula CASE é usada para verificar o nome da categoria na tabela `testing.categories` e retornar mensagens específicas com base no nome. Se o nome for 'Cosméticos e Perfumaria', retorna 'Sim, aqui é a categoria Cosméticos e Perfumaria'. Se o nome for 'Informática', retorna 'Sim, aqui é a categoria Informática'. Caso contrário, retorna 'Não encontrou as categorias acima'.

2. **IF**:
   - O comando IF é uma função condicional que permite executar uma ação com base em uma condição verdadeira ou falsa.
   - Sintaxe:
     ```
     IF(condition, true_value, false_value)
     ```
   - Explicação: No segundo código fornecido, a função IF é usada para verificar o nome da categoria na tabela `testing.categories` e retornar mensagens específicas com base no nome. É semelhante ao CASE, mas usa uma sintaxe mais compacta.

3. **COALESCE**:
   - A função COALESCE é usada para retornar o primeiro valor não nulo em uma lista de expressões.
   - Sintaxe:
     ```
     COALESCE(value1, value2, ...)
     ```
   - Explicação: No terceiro código fornecido, a função COALESCE é usada para substituir valores nulos na coluna `additionals` da tabela `testing.customers` pela mensagem 'Ops!, o complemento é nulo'. Isso é aplicado apenas aos primeiros 10 clientes selecionados pela cláusula LIMIT.

Esses comandos condicionais permitem que você escreva consultas SQL mais flexíveis e dinâmicas, adaptando o resultado com base nas condições específicas fornecidas.