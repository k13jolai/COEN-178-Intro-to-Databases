SELECT empname, deptname
	FROM I_EMP, I_DEPT
	WHERE I_EMP.deptid = I_DEPT.deptid and deptname IN('Testing');

SELECT empname
	FROM I_EMP
	WHERE I_EMP.deptid IN(SELECT deptid FROM I_DEPT WHERE deptname='Testing');

SELECT empname FROM I_EMP WHERE exists
	(SELECT* FROM I_DEPT where I_EMP.deptid=I_DEPT.deptid and deptname='Testing');


SELECT deptname, deptid
	FROM I_DEPT
	WHERE deptid NOT IN(SELECT deptid FROM I_EMP);

SELECT deptname FROM I_DEPT WHERE not exists
	(SELECT * FROM I_EMP WHERE I_EMP.deptid=I_DEPT.deptid);
