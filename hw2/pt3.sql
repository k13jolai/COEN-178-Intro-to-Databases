CREATE OR REPLACE TRIGGER cancelOrder_trig
AFTER DELETE 
	ON MealOrder
	FOR EACH ROW
BEGIN
	--Copy vars from MealOrdertable
	INSERT INTO CancelledOrders
		VALUES(:old.acctId, :old.menuId, :old.startDate, :old.endDate);
		 dbms_output.put_line('Order added to cancelled orders table');
END;
/
show errors;
