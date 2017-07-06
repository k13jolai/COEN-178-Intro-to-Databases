INSERT INTO Course_Prereq VALUES(133,12);

UPDATE Course_Prereq
SET courseno = 121
WHERE courseno = 133;

/*3) The following update failed because it is trying to call an update to change a table while the table being called on
is being written to by an insert. 
