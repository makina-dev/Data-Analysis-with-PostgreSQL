
--Find managers with at least 7 direct reporting employees.
--Output first names of managers.


select first_name,last_name
from employee AS T1

JOIN

(select manager_id 
FROM employee 
GROUP BY manager_id
HAVING COUNT(*)>=7) AS T2

ON 

T1.id=T2.manager_id