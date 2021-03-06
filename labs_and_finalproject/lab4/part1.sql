/*
 * Exercise 1
 */

CREATE TABLE DEPT_4 (
	deptno CHAR(5) PRIMARY KEY,
	deptname CHAR(10),
	location CHAR(20),
	budget NUMBER(10,2),
	extra_funds NUMBER(10,2),
	CONSTRAINT DEPT_4cons1 CHECK(budget >= 0),
	CONSTRAINT DEPT_4cons2 CHECK(extra_funds <= budget)
);

/*
 * Sucess or Failure? If failure, why?
-Fails because second constraint is violated. Budget less than extra funds.
 * Comment out this query if it fails.
 
INSERT INTO DEPT_4
	VALUES('D2', 'testing', 'SFO', 20000.00, 50000.00);

/*
 * Sucess or Failure? If failure, why?
Sucess.
 */
INSERT INTO DEPT_4
	VALUES('D2', 'testing', 'SFO', 50000.00, 20000.00);

/*
 * Sucess or Failure? If failure, why?
sucess.
 */
INSERT INTO DEPT_4
	VALUES('D1', 'testing', 'SJ', 10000.00, 2000.00);
/*
INSERT INTO DEPT_4
	VALUES('D1', 'testing', 'SJ', NULL, NULL);

/*
 * Sucess or Failure? If failure, why?
Failure because not all values can be modified to "not null" since null values exist.
 * If failure, please resolve it before running this query (by writing another query above it).
 */
ALTER TABLE DEPT_4
	MODIFY budget NUMBER(10,2) NOT NULL;

/*
 * The following adds constraint limiting location to 'SJ', 'SFO', and 'LA'.
 */
ALTER TABLE DEPT_4
	ADD CONSTRAINT DEPT_4cons3
	CHECK (location IN ('SJ', 'SFO', 'LA'));

/*
 * Sucess or Failure? If failure, why?
Failure because new constraint is violated. Location is not SJ, SFO, or LA
 */

/*INSERT INTO DEPT_4
	VALUES('D9', 'testing', 'NY', 10000, 1000);

/*
 * Use the following to check constraints.
 */
SELECT status
FROM user_constraints
WHERE UPPER(constraint_name) = UPPER('Dept_4cons1');




/*
 * Exercise 2
 */
CREATE TABLE EMP_4 (
	empno INTEGER PRIMARY KEY,
	empname CHAR(20),
	deptid CHAR(5) NOT NULL,
	salary NUMBER(10,2),
	gender CHAR(2),
	CONSTRAINT dept_fkey
		FOREIGN KEY (deptid)
			REFERENCES DEPT_4(deptno)
		ON DELETE CASCADE
);


/*
 * Use ALTER TABLE to add constraint limiting gender to 'M' or 'F'
 */





/*
 * Sucess or Failure? If failure, why?
Failure because D13 does not exist in DEPT_4

 * If failure, please resolve it before running this query (by writing another query above it).
 */
INSERT INTO DEPT_4
	VALUES('D13', 'testing', 'SJ', 60000.00, 5000.00);

INSERT INTO EMP_4
	VALUES(1, 'Smith', 'D13', 60000.00, 'F');


/*
 * Write query to delete row whose deptno is 'D13' in DEPT_4.
 * What happens to empno = 1 in EMP_4?
The value from empno =1 is also deleted, leading to no values selected when
the command SELECT * FROM EMP_4 is run. 
 */
DELETE FROM DEPT_4
WHERE deptno='D13';



/*
 * To confirm your script is correct, run the following two queries.
 * Then, execute this script. There should be no errors.
 

DROP TABLE EMP_4;
DROP TABLE DEPT_4;
*/
