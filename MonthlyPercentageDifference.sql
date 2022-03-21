-- Monthly Percentage Difference
-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
-- The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100

select
to_char(created_at:: date, 'YYYY-MM') AS year_month,
round((sum(value)-lag(sum(value), 1) OVER(t))/lag(sum(value), 1) OVER(t)* 100, 2) AS revenue_diff
from sf_transactions
GROUP BY year_month
WINDOW t as (ORDER BY to_char(created_at::date,'YYYY-MM'))
ORDER BY year_month ASC