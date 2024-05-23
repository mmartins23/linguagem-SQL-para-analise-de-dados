-- Calculate the total price of 'Sapato' and 'Bolsa'
SELECT
  (
    SELECT
      price
    FROM
      testing.products
    WHERE
      name = 'Sapato'
  ) + (
    SELECT
      price
    FROM
      testing.products
    WHERE
      name = 'Bolsa'
  ) AS total_price;

-- Calculate the price difference between 'Calça' and 'Camisa'
SELECT
  (
    SELECT
      price
    FROM
      testing.products
    WHERE
      name = 'Calça'
  ) - (
    SELECT
      price
    FROM
      testing.products
    WHERE
      name = 'Camisa'
  ) AS price_difference;
