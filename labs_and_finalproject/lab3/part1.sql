SELECT deptid, COUNT(empno)
FROM l_emp
GROUP BY deptid;

SELECT deptid AS deptno, COUNT(empnO) AS empcount
FROM l_emp
GROUP BY deptid;
