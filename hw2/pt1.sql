CREATE OR REPLACE PROCEDURE addMealOrder
	(acctId_param IN MealOrder.acctId%type, 
	menuId_param IN MealOrder.menuId%type, 
	startDate_param IN MealOrder.endDate%type,
	endDate_param IN MealOrder.endDate%type)
	--acctId, menuId, startDate, endDate
AS
	BEGIN
		INSERT INTO MealOrder VALUES(acctId_param, menuId_param, startDate_param, endDate_param);
	END addMealOrder;
	/
	show errors;

