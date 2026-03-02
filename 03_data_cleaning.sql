-- identifying the duplicates
select order_id, order_date, total_amount, count(*) as occurance
from customer_orders
group by order_id, order_date, total_amount
having count(*)>1;

-- this creates  a temporary list where each duplicate gets a 'rank'
WITH DuplicateCTE AS (
  SELECT
    order_id
  FROM (
    SELECT
      order_id,
      ROW_NUMBER() OVER (
        PARTITION BY user_id, order_date, total_amount
        ORDER BY order_id
      ) AS row_num
    FROM customer_orders
  ) t
  WHERE row_num > 1
)
DELETE c
FROM customer_orders c
JOIN DuplicateCTE d
ON c.order_id = d.order_id;
