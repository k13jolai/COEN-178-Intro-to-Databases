INSERT INTO MealItem VALUES('1','oatmeal',3.00,120);
INSERT INTO MealItem VALUES('2','fruit_plate',7.50,220);
INSERT INTO MealItem VALUES('3','steak',20.99,420);
INSERT INTO MealItem VALUES('4','chicken pie',12.50,350);
INSERT INTO MealItem VALUES('5','broccoli pie',10.00,200);
INSERT INTO MealItem VALUES('6','noodles',3.20,200);
INSERT INTO MealItem VALUES('7','chips',1.00,180);

INSERT INTO MealMenu VALUES('M1','1','B');
INSERT INTO MealMenu VALUES('M2','2','L');
INSERT INTO MealMenu VALUES('M3','3','L');
INSERT INTO MealMenu VALUES('M4','4','D');
INSERT INTO MealMenu VALUES('M5','5','D');
INSERT INTO MealMenu VALUES('M6','6','L');
INSERT INTO MealMenu VALUES('M7','7','L');

INSERT INTO Customer VALUES('A1','Smith','4085551212');
INSERT INTO Customer VALUES('A4','Jones','4085554444');
INSERT INTO Customer VALUES('A2','Clark','4083331212');
INSERT INTO Customer VALUES('A6','Chen','4086661212');
INSERT INTO Customer VALUES('A9','Mayer','4086661212');
INSERT INTO Customer VALUES('A10','Smith','4085551212');
INSERT INTO Customer VALUES('A8','Lai','4084828740');
INSERT INTO Customer VALUES('A7','Yu','4085551222');

INSERT INTO MealOrder VALUES('A1','M1',TO_DATE('2016/01/10','yyyy/mm/dd'), TO_DATE('2016-01-16', 'yyyy/mm/dd'));
INSERT INTO MealOrder VALUES('A1','M2',TO_DATE('2016-01-10','yyyy/mm/dd'), TO_DATE('2016-01-16', 'yyyy/mm/dd'));
INSERT INTO MealOrder VALUES('A2','M3',TO_DATE('2016-02-10','yyyy/mm/dd'), TO_DATE('2016-02-26', 'yyyy/mm/dd'));
INSERT INTO MealOrder VALUES('A2','M1',TO_DATE('2016-03-11','yyyy/mm/dd'), TO_DATE('2016-03-26', 'yyyy/mm/dd'));
INSERT INTO MealOrder VALUES('A4','M5',TO_DATE('2016-04-07','yyyy/mm/dd'), TO_DATE('2016-05-07', 'yyyy/mm/dd'));
INSERT INTO MealOrder VALUES('A8','M6',TO_DATE('2016-01-10','yyyy/mm/dd'), TO_DATE('2016-01-11', 'yyyy/mm/dd'));
INSERT INTO MealOrder VALUES('A7','M7',TO_DATE('2016-01-10','yyyy/mm/dd'), TO_DATE('2016-01-11', 'yyyy/mm/dd'));

