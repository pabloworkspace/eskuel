 LISTA 5
/*1*/
SELECT last_name, salary
FROM employees
WHERE salary > 
0.9*(SELECT salary FROM employees WHERE last_name='Chen');

/*2*/
SELECT employees.last_name, employees.salary, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE salary > ALL
(SELECT salary FROM employees JOIN departments USING (department_id) WHERE departments.department_name='Marketing');

/*3*/
SELECT department_name, COUNT(*)
FROM departments
INNER JOIN employees
ON departments.DEPARTMENT_ID = employees.department_id
GROUP BY department_name
HAVING COUNT(*)>
(SELECT COUNT(*) FROM departments JOIN employees USING (department_id) WHERE department_name = 'IT');

/*4*/
SELECT last_name, salary, "Liczba pracownikow"
FROM employees
INNER JOIN (SELECT manager_id AS "Manager", COUNT(*) AS "Liczba pracownikow"
FROM employees
GROUP BY manager_id)
ON employees.manager_id = "Manager";
