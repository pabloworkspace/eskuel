--1
CREATE TABLE STUDENCI
( 
Numer_indeksu NUMBER(6,0) PRIMARY KEY, 
Imie VARCHAR2(16)  NOT NULL,
Nazwisko VARCHAR2(32)  NOT NULL,
Data_ur DATE  ,
Srednia_ocen NUMBER(2,1)  CHECK (srednia_ocen >= 2.0 AND srednia_ocen <= 5.5),
Plec CHAR(1)  NOT NULL CHECK(Plec = 'M' OR PLEC = 'K')
 );

--2
INSERT INTO STUDENCI( Numer_indeksu, Imie, Nazwisko, Data_ur, Srednia_ocen, Plec )
VALUES(209866,'Pawel','Garbicz','1994-10-11',5.0,'M');

INSERT INTO STUDENCI( Numer_indeksu, Imie, Nazwisko, Data_ur, Srednia_ocen, Plec )
VALUES(210154,'Ewa','Malysz','1960-11-22',5.0,'K');

--3
ALTER TABLE STUDENCI
Modify Srednia_ocen NUMBER(2,1) 
default 5.5

--4
CREATE VIEW stud_view AS
SELECT srednia
FROM Studenci
WHERE Plec= 'K';

--5
DROP TABLE studenci;
DROP VIEW stud_view;

--6
CREATE TABLE bands
( 
band_level INTEGER PRIMARY KEY CHECK(band_level > 0 AND band_level < 4), 
value1 VARCHAR2(8)  NOT NULL,
position CHAR(2)  NOT NULL
);

--7.1
ALTER TABLE employees
ADD band_level 
Integer REFERENCES bands(band_level);

UPDATE EMPLOYEES SET band_level = CEIL((SELECT salary FROM EMPLOYEES WHERE EMPLOYEE_ID = 1 ))
WHERE employee_id= '10';

ALTER TABLE employees
MODIFY band_level DEFAULT (CEIL(SELECT salary FROM EMPLOYEES WHERE EMPLOYEE_ID = 1 ))
MODIFY band_level DEFAULT (CEIL(SELECT salary FROM EMPLOYEES WHERE EMPLOYEE_ID = 2 ))
MODIFY band_level DEFAULT (CEIL(SELECT salary FROM EMPLOYEES WHERE EMPLOYEE_ID = 3 ))
SELECT * FROM dual;

--7.2
CREATE VIEW EMP_BAND AS
SELECT employees.last_name,employees.position
FROM employees join bands on band_level;


