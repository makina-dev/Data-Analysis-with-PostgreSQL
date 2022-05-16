select
first_name,
order_details,
round(total_order_cost/sum(total_order_cost) over(PARTITION BY first_name)::FLOAT*100)as percentage_of_total_spend
from orders o
JOIN customers c
ON c.id= o.cust_id
ORDER BY first_name