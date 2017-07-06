SELECT empname, deptname
FROM l_dept NATURAL JOIN l_emp;

SELECT empname, deptname
FROM l_dept LEFT JOIN  l_emp 
ON l_dept.deptid=l_emp.deptid;
