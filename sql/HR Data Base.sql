-- 1. Get all employees.

-- 2. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"

-- 3. Display all the values of the “First_Name” column using the alias “Employee Name”.

-- 4. Write a query to get all employee details from the employee table order by first name, descending.

-- 5. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).

-- 6. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

-- 7. Write a query to get the total salaries payable to employees.

-- 8. Write a query to get the maximum and minimum salary from employees table.

-- 9. Write a query to get the average salary and number of employees in the employees table.

-- 10. Write a query to get the number of employees working with the company.

-- 11. Write a query to get the number of jobs available in the employees table.

-- 12. Write a query to get the number of employees with the same job.

-- 13. Write a query to get the difference between the highest and lowest salaries.
SELECT j.JOB_ID , j.JOB_TITLE , j.MIN_SALARY , j.MAX_SALARY , (j.MAX_SALARY - j.MIN_SALARY) DIF
FROM jobs j 
ORDER BY DIF DESC
;
SELECT MAX(e.SALARY) - MIN(e.SALARY)
FROM employees e 
;

-- 14. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.

-- 15. Write a query to get the department ID and the total salary payable in each department.

-- 16. Write a query to get the average salary for each job ID excluding programmer.
SELECT e.JOB_ID, j.JOB_TITLE  , AVG(e.SALARY) SAVG
FROM employees e 
	INNER JOIN jobs j ON j.JOB_ID = e.JOB_ID 
WHERE e.JOB_ID <> 'IT_PROG'
GROUP BY e.JOB_ID , j.JOB_TITLE 
ORDER BY SAVG;

-- 17. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.

-- 18. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT e.JOB_ID , MAX(e.SALARY) 
FROM employees e 
GROUP BY e.JOB_ID 
;

-- 19.  Write a query to get the average salary for all departments employing more than 10 employees.

-- 20. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. Hint : Use NATURAL JOIN.
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , l.LOCATION_ID , l.STREET_ADDRESS , l.CITY , l.STATE_PROVINCE , c.COUNTRY_NAME 
FROM departments d 
	NATURAL JOIN locations l 
	LEFT JOIN countries c ON c.COUNTRY_ID = l.COUNTRY_ID
;
SELECT d.DEPARTMENT_ID , d.DEPARTMENT_NAME , l.LOCATION_ID , l.STREET_ADDRESS , l.CITY , l.STATE_PROVINCE , c.COUNTRY_NAME 
FROM departments d 
	NATURAL JOIN locations l 
	INNER JOIN countries c ON c.COUNTRY_ID = l.COUNTRY_ID
;

-- 21. Write a query to find the name (first_name, last name), department ID and name of all the employees.

-- 22. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

-- 23. Write a query to get the department name and number of employees in the department.

-- 24. Write a query to display the department name, manager name, and city.

-- 25. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
SELECT 
	 e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , e.SALARY ,
	 jh.START_DATE , jh.END_DATE , jh.JOB_ID 
FROM 
	employees e 
	 INNER JOIN job_history jh ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
WHERE e.SALARY > 10000
ORDER BY e.EMPLOYEE_ID, jh.START_DATE  
;
SELECT 
	 e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , e.SALARY ,
	 jh.START_DATE , jh.END_DATE , jh.JOB_ID 
FROM 
	employees e 
	 LEFT JOIN job_history jh ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
WHERE e.SALARY > 10000
ORDER BY e.EMPLOYEE_ID, jh.START_DATE  
;
SELECT 
	 e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , e.SALARY ,
	 jh.START_DATE , jh.END_DATE ,
	 j.JOB_ID , j.JOB_TITLE , j.MIN_SALARY , j.MAX_SALARY ,
	 d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 
	employees e 
	 INNER JOIN job_history jh ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
	 INNER JOIN jobs j ON j.JOB_ID = jh.JOB_ID 
	 INNER JOIN departments d ON d.DEPARTMENT_ID = jh.DEPARTMENT_ID 
WHERE e.SALARY > 10000
ORDER BY e.EMPLOYEE_ID, jh.START_DATE  
;
SELECT 
	 e.EMPLOYEE_ID , e.FIRST_NAME , e.LAST_NAME , e.SALARY ,
	 jh.START_DATE , jh.END_DATE ,
	 j.JOB_ID , j.JOB_TITLE , j.MIN_SALARY , j.MAX_SALARY ,
	 d.DEPARTMENT_ID , d.DEPARTMENT_NAME 
FROM 
	employees e 
	 LEFT JOIN job_history jh ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID 
	 LEFT JOIN jobs j ON j.JOB_ID = jh.JOB_ID 
	 LEFT JOIN departments d ON d.DEPARTMENT_ID = jh.DEPARTMENT_ID 
WHERE e.SALARY > 10000
ORDER BY e.EMPLOYEE_ID, jh.START_DATE  
;

-- 26. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

-- 27. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
SELECT e.FIRST_NAME  , e.*
FROM employees e 
WHERE e.FIRST_NAME like '%b%c%' -- OJO, no es case sensitive!!!
;

-- 28. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.

-- 29. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.

-- 30. Write a query to get the distinct Mondays from hire_date in employees tables.
