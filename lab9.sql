9.1

CREATE OR REPLACE TRIGGER trigger1 AFTER UPDATE OF salary ON employees FOR EACH ROW
BEGIN
IF (:NEW.salary >5000) THEN
INSERT INTO emp_gotrich VALUES ( :OLD.employee_id, SYSDATE, :OLD.salary, :NEW.salary );
END IF;
END;

9.2

CREATE OR REPLACE TRIGGER trigger2 BEFORE UPDATE OF department_id ON employees FOR EACH ROW
BEGIN
:NEW.salary:=:OLD.salary*11/10;
END;

9.3

CREATE OR REPLACE TRIGGER trigger3 AFTER INSERT OR UPDATE OR DELETE ON departments
BEGIN
IF UPDATING THEN
INSERT INTO dept_changes VALUES (SYSDATE, 'upd');
END IF;

IF INSERTING THEN
INSERT INTO dept_changes VALUES (SYSDATE, 'ins');
END IF;

IF DELETING THEN
INSERT INTO dept_changes VALUES (SYSDATE, 'del');
END IF;

END;

9.4

CREATE OR REPLACE TRIGGER trigger4 BEFORE INSERT OR DELETE ON employees
DECLARE
liczba_pracownikow NUMBER (5,0);
BEGIN
SELECT COUNT (*) INTO liczba_pracownikow FROM employees;
INSERT INTO emp_count VALUES (liczba_pracownikow, SYSDATE);
END;

9.5

CREATE TABLE kopia
AS (SELECT * FROM employees);


CREATE OR REPLACE TRIGGER trigger5 AFTER UPDATE OF manager_id ON kopia FOR EACH ROW
BEGIN
IF (:NEW.manager_id IS NULL) THEN
INSERT INTO emp_promoted VALUES (:OLD.employee_id, SYSDATE);
END IF;
END;