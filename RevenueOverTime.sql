-- Revenue Over Time
-- Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. Do not include returns which are represented by negative purchase values. Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.

-- A 3-month rolling average is defined by calculating the average total revenue from all user purchases for the current month and previous two months. The first two months will not be a true 3-month rolling average since we are not given data from last year. Assume each month has at least one purchase.

WITH revenues as(
    select to_char(created_at::date,'YYYY-MM') AS month_year,
    sum(purchase_amt) AS revenue_month
    from amazon_purchases
    WHERE purchase_amt>=0
    GROUP BY month_year)
select month_year,
avg(revenue_month) OVER (ORDER BY month_year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as rolling_average
from revenues
