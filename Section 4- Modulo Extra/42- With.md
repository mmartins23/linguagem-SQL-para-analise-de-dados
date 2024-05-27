O comando `WITH` em SQL, também conhecido como Common Table Expression (CTE), é usado para definir uma expressão de tabela temporária que pode ser referenciada dentro de uma `SELECT`, `INSERT`, `UPDATE`, ou `DELETE` statement. CTEs podem melhorar a legibilidade e a organização das consultas SQL, especialmente quando você precisa reutilizar subconsultas.

### Estrutura Básica

```sql
WITH cte_name AS (
    -- Subconsulta
    SELECT ...
)
SELECT ...
FROM cte_name;
```

### Exemplo Básico 1: Filtrar Dados

Suponha que temos uma tabela chamada `employees` e queremos calcular a média de salários e depois selecionar os funcionários que ganham acima da média.

```sql
WITH avg_salary AS (
    SELECT AVG(salary) AS avg_sal
    FROM employees
)
SELECT name, salary
FROM employees, avg_salary
WHERE employees.salary > avg_salary.avg_sal;
```

Neste exemplo:
1. **CTE `avg_salary`**: Calcula a média dos salários.
2. **Consulta principal**: Seleciona os funcionários que ganham acima da média calculada pela CTE.

### Exemplo Básico 2: Hierarquia de Dados

Suponha que temos uma tabela `employees` com uma coluna `manager_id` que aponta para o ID do gerente de um funcionário. Queremos encontrar todos os subordinados diretos de um gerente específico.

```sql
WITH direct_reports AS (
    SELECT employee_id, name, manager_id
    FROM employees
    WHERE manager_id = 101 -- ID do gerente específico
)
SELECT *
FROM direct_reports;
```

Neste exemplo:
1. **CTE `direct_reports`**: Seleciona todos os funcionários que têm `manager_id` igual a 101.
2. **Consulta principal**: Seleciona todos os registros da CTE.

### Exemplo Básico 3: CTEs Recursivas

CTEs podem ser recursivas, o que é útil para trabalhar com dados hierárquicos. Suponha que queremos encontrar todos os níveis de subordinados de um gerente específico.

```sql
WITH RECURSIVE employee_hierarchy AS (
    -- CTE de âncora: seleciona o gerente inicial
    SELECT employee_id, name, manager_id
    FROM employees
    WHERE employee_id = 101
    
    UNION ALL
    
    -- CTE recursiva: seleciona os subordinados dos funcionários encontrados na iteração anterior
    SELECT e.employee_id, e.name, e.manager_id
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy;
```

Neste exemplo:
1. **CTE de âncora**: Seleciona o gerente inicial.
2. **CTE recursiva**: Iterativamente seleciona os subordinados dos funcionários encontrados na iteração anterior.
3. **Consulta principal**: Seleciona todos os registros da CTE recursiva, resultando em todos os níveis de subordinados do gerente específico.

### Benefícios do uso de CTEs

1. **Melhora a legibilidade do código**: CTEs ajudam a dividir uma consulta complexa em partes mais manejáveis e fáceis de entender.
2. **Reutilização de código**: Você pode definir uma CTE uma vez e usá-la várias vezes dentro da mesma consulta.
3. **Organização**: Facilita a organização e a manutenção do código SQL, especialmente em consultas longas e complexas.

### Limitações

- **Escopo limitado**: As CTEs só existem dentro da consulta onde são definidas.
- **Desempenho**: Em alguns casos, especialmente com CTEs recursivas, o desempenho pode ser inferior em comparação com outras abordagens, como tabelas temporárias ou subconsultas otimizadas.

### Conclusão

O `WITH` (CTE) é uma ferramenta poderosa no SQL que ajuda a estruturar consultas complexas de maneira mais clara e eficiente. É especialmente útil para cálculos intermediários e consultas hierárquicas.