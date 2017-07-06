CREATE OR REPLACE TRIGGER LimitTest
	FOR INSERT ON Course_Prereq
		COMPOUND TRIGGER
	
	v_max_prereqs CONSTANT INTEGER := 2;
	v_curnum INTEGER := 1;
	v_cno INTEGER;
	BEFORE EACH ROW IS
	BEGIN
		v_cno := :new.courseno;
	END BEFORE EACH ROW;
	AFTER STATEMENT IS
	BEGIN
		SELECT COUNT(*) INTO v_curnum
		FROM Course_Prereq
		WHERE courseno = v_cno
		GROUP BY courseNo;
		IF v_curnum > v_max_prereqs THEN
			RAISE_APPLICATION_ERROR(-20000,'Only 2 prereqs for course');
		END IF;
	END AFTER STATEMENT;
END;
/
show errors;

INSERT INTO Course_Prereq VALUES(121,11);
INSERT INTO Course_Prereq VALUES(121,10);
INSERT INTO Course_Prereq VALUES(121,12);
INSERT INTO Course_Prereq VALUES(133,12);

UPDATE Course_Prereq
SET courseno = 121
WHERE courseno = 133;
/* The constraint that a course cannot have more than 2 prereqs is NOT enforced because no error was raised after updating the table.
