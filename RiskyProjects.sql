select 
 title,budget,CEILING((end_date - start_date)/365::float * yearly_salary_sum) AS project_salary_sum
from linkedin_projects

JOIN

(select 
project_id , sum(salary) AS yearly_salary_sum 
from linkedin_emp_projects a JOIN linkedin_employees b ON a.emp_id = b.id
GROUP by project_id) yearly_salary
ON linkedin_projects.id = yearly_salary.project_id 

WHERE (end_date - start_date)/ 365:: float * yearly_salary_sum > budget


