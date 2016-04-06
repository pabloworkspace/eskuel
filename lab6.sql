--1
INSERT INTO EMPLOYEES(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,MANAGER_ID,DEPARTMENT_ID)
VALUES
(9999,'Thomas','Dunk','thomas@dunk.com',
(SELECT EMPLOYEES.PHONE_NUMBER FROM employees WHERE last_name='Chung'),
(SELECT HIRE_DATE FROM employees WHERE last_name='Chung'),
'AD_PRES',10,
(SELECT EMPLOYEES.MANAGER_ID FROM employees WHERE last_name='Chung'),
10);

--2
UPDATE EMPLOYEES SET 
salary = (SELECT AVG(salary) FROM EMPLOYEES)
WHERE employee_id = '10';

--3
UPDATE EMPLOYEES SET 
manager_id= (SELECT manager_id FROM EMPLOYEES WHERE salary > 17000)
WHERE employee_id = '10';

--4
DELETE FROM employees 
WHERE Phone_number = null;

