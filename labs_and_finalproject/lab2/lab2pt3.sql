CREATE TABLE I_EMP(
	empNO INTEGER PRIMARY KEY,
	empname CHAR(10),
	deptid CHAR(5)
);

CREATE TABLE I_DEPT(
	deptid CHAR(5) PRIMARY KEY,
	deptname CHAR(10)
);

INSERT INTO I_EMP values('1','smith','d1');
INSERT INTO I_EMP values('2','jones','d2');
INSERT INTO I_EMP values('3','wayne','d1');
INSERT INTO I_EMP values('4','moor','d3');
INSERT INTO I_EMP values('5','king','d1');
INSERT INTO I_EMP values('6','chen','d1');
INSERT INTO I_EMP values('7','winger','d3');

INSERT INTO I_DEPT values('d1','Research');
INSERT INTO I_DEPT values('d2','Devt');
INSERT INTO I_DEPT values('d3','Testing');
INSERT INTO I_DEPT values('d4','Advert');

