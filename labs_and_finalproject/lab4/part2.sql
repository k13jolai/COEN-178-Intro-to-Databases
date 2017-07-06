/*
 * Exercise 3
 */

/*
 * Write a CREATE TABLE PROJECT_4 with the following properties:
 *
 * projectid:  a string of char (you are free to choose the length), primary key
 * projectname: a string of char (you are free to choose the length)
 * resources: a number (10,2) cannot be null
 * dno: char length 5, foreign key into the table DEPT_4, matching primary key (deptno)
 * constraint: when a row in the DEPT_4 is deleted, any rows referencing the deleted row should be deleted as well
 */

 CREATE TABLE PROJECT_4(
	projectid CHAR(15) PRIMARY KEY, 
	projectname CHAR(15),
	resources NUMBER(10,2) NOT NULL,
	dno CHAR(5),
	CONSTRAINT dno_cascade
	FOREIGN KEY(dno) REFERENCES DEPT_4(deptno) ON DELETE CASCADE 
);


/*
 * Insert 5 rows to PROJECT_4.
 * Insert rows into EMP_4 and DEPT_4 as needed.
 */
INSERT INTO DEPT_4
	VALUES('D3', 'testing-a', 'SJ', 60000.00, 5000.00);
INSERT INTO DEPT_4
	VALUES('D4', 'research', 'SJ', 60000.00, 5000.00);
INSERT INTO DEPT_4
	VALUES('D5', 'dev1', 'SJ', 60000.00, 5000.00);
INSERT INTO PROJECT_4 VALUES('21', 'VR', 21000.00, 'D1');
INSERT INTO PROJECT_4 VALUES('22', 'DRONES', 30000.00,'D2');
INSERT INTO PROJECT_4 VALUES('23', 'AI', 30000.00,'D3');
INSERT INTO PROJECT_4 VALUES('24', 'DATABASE', 33000.00,'D4');
INSERT INTO PROJECT_4 VALUES('25', 'COMPILERS', 34000.00,'D5');


/*
 * Write a CREATE TABLE Works_4 with the following properties:
 *
 * empno: same type as empno in EMP_4 table
 * projectno: A string of char (same as that of ProjectId in the Projects_4 table)
 * startdate: Date
 * empno and ProjectNo (together) form the primary key for this table.
 * empno is foreign key into EMP_4 table.
 * projectno is foreign key into PROJECT_4 table.
 */

CREATE TABLE WORKS_4(
	empno INTEGER,
	projectno CHAR(15),
	startdate DATE,
	CONSTRAINT project_workers PRIMARY KEY(empno,projectno),
	FOREIGN KEY(empno) REFERENCES EMP_4(empno),
	FOREIGN KEY(projectno) REFERENCES PROJECT_4(projectid)
);





/*
 * Insert 5 rows to WORKS_4.
 * Insert rows into EMP_4, DEPT_4, and PROJECT_4 as needed.
 */

INSERT INTO EMP_4 VALUES(2, 'Young', 'D1', 60000.00, 'M');
INSERT INTO EMP_4 VALUES(3, 'Chase', 'D2', 60000.00, 'F');
INSERT INTO EMP_4 VALUES(4, 'Goh', 'D1', 60000.00, 'M');
INSERT INTO EMP_4 VALUES(5, 'Keys', 'D1', 60000.00, 'M');
INSERT INTO EMP_4 VALUES(6, 'Law', 'D2', 60000.00, 'F');

INSERT INTO WORKS_4 VALUES(2, 21, '29-JUN-16');
INSERT INTO WORKS_4 VALUES(3, 21, '29-JUN-16');
INSERT INTO WORKS_4 VALUES(4, 23, '29-JUN-16');
INSERT INTO WORKS_4 VALUES(5, 24, '29-JUN-16');
INSERT INTO WORKS_4 VALUES(6, 25, '29-JUN-16');
/*
 * Exercise 4
 * Write a query to show the employees (empno) working on a project.
 * Order by projectno.
 */
SELECT projectno, empno
FROM WORKS_4
ORDER BY projectno;

 

