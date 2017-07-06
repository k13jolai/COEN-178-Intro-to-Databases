/* 1) I believe that the prerequisites are in a separate table from the Course table such that we can 
call a trigger that checks the pre-requisites for a course using a trigger without running into a mutating table error
that would otherwise be caused from checking the course table while it is undergoing change. */

CREATE TABLE Course(
	courseNo
	INTEGER PRIMARY KEY,
	courseName VARCHAR(20)
);
CREATE TABLE Course_Prereq(
	courseNo INTEGER,
	prereqNo INTEGER,
	FOREIGN KEY (prereqNo) REFERENCES Course (courseNo)
);

INSERT INTO Course VALUES (10,'C++');
INSERT INTO Course VALUES (11,'Java');
INSERT INTO Course VALUES (12,'Python');
INSERT INTO Course VALUES (121,'Web');
INSERT INTO Course VALUES (133,'Software Eng');

CREATE OR REPLACE TRIGGER LimitTest
BEFORE INSERT OR UPDATE ON Course_Prereq
-- A row level trigger
FOR EACH ROW
	DECLARE
	v_max_prereq CONSTANT INTEGER := 2;
	v_curnum INTEGER;
	BEGIN
		BEGIN
			SELECT COUNT(*) INTO v_curnum
			FROM Course_Prereq
			WHERE courseno = :new.courseno
			GROUP BY courseno;
			EXCEPTION WHEN no_data_found THEN
				DBMS_OUTPUT.put_line('not found');
				v_curnum := 0;
		END;
		IF v_curnum > 0 THEN
			IF v_curnum+ 1 > v_max_prereq THEN
				RAISE_APPLICATION_ERROR(-20000,'Only
				2 prereqs for course');
			END IF;
		END IF;
	END;
/
show errors;

