CREATE OR REPLACE FUNCTION mostCancelled
RETURN CHAR IS 
	ret CHAR(100);
	custname Customer.name%type;
	custnumber Customer.phone%type;
BEGIN
	SELECT name INTO custname
	FROM Customer
	WHERE acctId IN 
		(SELECT acctId 
		 FROM 
				(SELECT acctId, COUNT(menuID) as ORDERS
 	 			FROM CancelledOrders
 	 			GROUP BY acctId)
	   			WHERE ORDERS IN
	    	(SELECT MAX(ORDERS)
	    	FROM(SELECT acctId, COUNT(menuID) as ORDERS
 	 	FROM CancelledOrders
 	 	GROUP BY acctId)));

	SELECT phone INTO custnumber
	FROM Customer
	WHERE acctId IN 
		(SELECT acctId 
		 FROM 
				(SELECT acctId, COUNT(menuID) as ORDERS
 	 			FROM CancelledOrders
 	 			GROUP BY acctId)
	   			WHERE ORDERS IN
	    	(SELECT MAX(ORDERS)
	    	FROM(SELECT acctId, COUNT(menuID) as ORDERS
 	 	FROM CancelledOrders
 	 	GROUP BY acctId)));
	IF sql%notfound THEN
		ret:='no orders selected';
		RETURN ret;
	ELSIF sql%found THEN
		ret:=' name:' || custname || ' phone: ' || custnumber;
		RETURN ret;
	END IF;
END;
/
show errors;
