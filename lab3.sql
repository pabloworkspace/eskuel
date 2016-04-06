3.1. (EMPLOYEES, DEPARTMENTS) Nazw dzia³ów (department_name), nazwisk (last_name) oraz p³ac (salary) pracowników, którzy zarabiaj¹ ponad 12000, posortowane od najlepiej do najgorzej zarabiaj¹cych (6 wyników):
a) bez wykorzystania polecenia JOIN
b) z wykorzystaniem polecenia JOIN
 
3.2. (EMPLOYEES, DEPARTMENTS, LOCATIONS) Nazwisk pracowników (last_name), nazw ich dzia³ów (department_name) i miast (city), w których pracuj¹ (106 wyników):
a) bez wykorzystania polecenia JOIN
b) z wykorzystaniem polecenia JOIN
 
3.3. (DEPARTMENTS, EMPLOYEES) Nazw dzia³ów (department_name) i iloœci pracowników, którzy w nich pracuj¹ (11 wyników).
 
*3.4. Pañstw (country_name) i iloœci pracowników, którzy w nich pracuj¹ (4 wyniki).
 
**3.5. (EMPLOYEES) Nazwisk pracowników (last_name) i nazwisk ich kierowników (last_name), posortowane rosn¹co po nazwiskach kierowników. U¿yj aliasów kolumn. (106 wyników)
 
 
=================
3.1 :
a) SELECT d.department_name, e.last_name, e.salary FROM employees e, departments d WHERE (d.department_id = e.department_id) AND (e.salary > 12000) ORDER BY salary DESC;
 
b) SELECT d.department_name, e.last_name, e.salary FROM employees e JOIN departments d ON d.department_id = e.department_id WHERE e.salary > 12000 ORDER BY salary DESC;
 
3.2 : 
a) SELECT e.last_name, d.department_name, l.city FROM employees e, departments d, locations l WHERE d.department_id = e.department_id AND l.location_id = d.location_id;
 
b)SELECT e.last_name, d.department_name, l.city FROM  departments d JOIN employees e ON d.department_id=e.department_id JOIN locations l ON d.location_id=l.location_id;
 
3.3 :
SELECT  d.department_name, COUNT(*) FROM departments d JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_name;
 
3.4 
SELECT  c.country_name, COUNT(*) FROM countries c JOIN locations l ON l.country_id = c.country_id JOIN departments d ON d.location_id = l.location_id JOIN employees e ON e.department_id = d.department_id GROUP BY c.country_name;
 
3.5
SELECT e.last_name, e2.last_name FROM employees e JOIN employees e2 ON e.employee_id = e2.manager_id ORDER BY e2.manager_id;
 