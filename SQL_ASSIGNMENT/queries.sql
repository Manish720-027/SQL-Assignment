
-- Q1 Display employee name, salary and city where salary > 50000


SELECT ename, salary, city
FROM Employee
WHERE salary > 50000;



-- Q2 Employees whose names start with J


SELECT *
FROM Employee
WHERE ename LIKE 'J%';



-- Q3 Employees from New York or Chicago


SELECT *
FROM Employee
WHERE city IN ('New York', 'Chicago');



-- Q4 Employee details in descending salary


SELECT *
FROM Employee
ORDER BY salary DESC;



-- Q5 Total salary


SELECT SUM(salary) AS total_salary
FROM Employee;



-- Q6 Average salary of male and female


SELECT gender,
AVG(salary) AS average_salary
FROM Employee
GROUP BY gender;



-- Q7 Maximum and Minimum Salary


SELECT
MAX(salary) AS maximum_salary,
MIN(salary) AS minimum_salary
FROM Employee;



-- Q8 Employee name, project and position


SELECT
e.ename,
ed.projects,
ed.empposition
FROM Employee e
INNER JOIN EmployeeDetails ed
ON e.empid  ed.empid;



-- Q9 Employees working on Project P1


SELECT
e.ename,
ed.projects
FROM Employee e
INNER JOIN EmployeeDetails ed
ON e.empid  ed.empid
WHERE ed.projects'P1';



-- Q10 Employees joined after 1-Feb-2022


SELECT
e.ename,
ed.doj
FROM Employee e
INNER JOIN EmployeeDetails ed
ON e.empided.empid
WHERE ed.doj>'2022-02-01';



-- Q11 Second highest salary


SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
OFFSET 1
LIMIT 1;



-- Q12 Salary greater than average salary


SELECT
ename,
salary
FROM Employee
WHERE salary >
(
SELECT AVG(salary)
FROM Employee
);



-- Q13 Number of employees in each project


SELECT
projects,
COUNT(*) AS total_employees
FROM EmployeeDetails
GROUP BY projects;



-- Q14 Highest paid employee in every project


SELECT
ed.projects,
e.ename,
e.salary
FROM Employee e
JOIN EmployeeDetails ed
ON e.empided.empid
WHERE (ed.projects,e.salary) IN
(
SELECT
ed2.projects,
MAX(e2.salary)
FROM Employee e2
JOIN EmployeeDetails ed2
ON e2.empided2.empid
GROUP BY ed2.projects
)
ORDER BY ed.projects;