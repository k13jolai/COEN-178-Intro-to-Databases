INSERT INTO Course_Prereq VALUES (121,11);
INSERT INTO Course_Prereq VALUES (121,10);
INSERT INTO Course_Prereq VALUES (121,12);
/*2) The insertion of the last value fails because it violates the trigger LimitTest
that checks that there are only 2 prereqs for a course. */
