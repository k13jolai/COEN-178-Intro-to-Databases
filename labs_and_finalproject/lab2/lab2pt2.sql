SELECT custid, firstname||lastname "FULLNAME", city
	FROM Customer;

SELECT custid, firstname, lastname, city
	FROM Customer
	ORDER BY lastname;

SELECT serviceid, custid, day
	FROM Schedule
	ORDER BY serviceid, custid DESC;

SELECT serviceid
	FROM DeliveryService
	WHERE serviceid NOT IN(SELECT serviceid FROM Schedule);

SELECT firstname, lastname
	FROM Customer
	WHERE custid IN(SELECT custid FROM Schedule WHERE day='m');

SELECT lastname
	FROM Customer
	WHERE custid IN(SELECT custid FROM Schedule);

SELECT MAX(servicefee) AS highest_Servicefee FROM DeliveryService;

SELECT COUNT(serviceid) AS Number_of_Deliveries_Scheduled, day
	FROM Schedule
	GROUP BY day;

SELECT T.custid, S.custid
	FROM Customer T, Customer S
	WHERE T.city=S.city AND T.custid <>S.custid;

SELECT custid, serviceid
	FROM Customer, DeliveryService
	WHERE Customer.city=DeliveryService.location;
