SELECT deptid, COUNT(*)
FROM l_emp
GROUP BY deptid
HAVING COUNT(*) IN
(SELECT MAX(empcount) 
FROM
(SELECT deptid, COUNT(*) AS empcount
FROM l_emp
GROUP By deptid));

