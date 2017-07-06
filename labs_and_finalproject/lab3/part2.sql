SELECT l_dept.deptid, deptname, empcount
FROM l_dept, 
(SELECT deptid, COUNT(empno) AS empcount
FROM l_emp
GROUP BY deptid) sq_alias
WHERE sq_alias.deptid=l_dept.deptid
ORDER BY deptid ASC;
