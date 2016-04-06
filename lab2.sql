1.SELECT DISTINCT job_id, manager_id FROM employees where (manager_id=100) or(manager_id=1) ORDER BY manager_id DESC;
2.SELECT last_name, salary from employees where (manager_id=100) and (salary>10000) ORDER BY SALARY DESC;
3.SELECT last_name as nazwisko, salary as pensja, job_id as numer from employees where job_id LIKE '%_MGR' order by salary desc;
4.SELECT job_id as numer, job_title as tytul FROM jobs WHERE job_title LIKE '% %';
5.SELECT employee_id, salary, job_id FROM employees WHERE (salary>3000) and job_id LIKE 'ST%' or job_id LIKE 'SH%' ORDER BY employee_id ASC;
6.SELECT job_id, COUNT(*) liczba_pracownikow FROM employees GROUP BY job_id ORDER BY liczba_pracownikow DESC;
7.SELECT manager_id, MAX(salary) FROM employees GROUP BY manager_id;
8.SELECT job_id as numer, AVG(salary) as srednia_pensja FROM employees GROUP BY job_id ORDER BY srednia_pensja DESC; 
9.SELECT job_ID AS numer_id, COUNT(manager_id) as ilosc_pracownikow, MIN(salary),AVG(salary) FROM employees WHERE (salary>5000) GROUP BY job_id ORDER BY ilosc_pracownikow ASC;
10.SELECT  manager_id as kierownicy, AVG(salary) as srednia_wyplata FROM employees GROUP BY manager_id HAVING AVG(salary)>5000;


