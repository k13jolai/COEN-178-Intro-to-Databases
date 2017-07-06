SELECT supplier.sno, supplier.sname, supplier.city
FROM supplier
WHERE NOT EXISTS
(SELECT *
	FROM parts
	WHERE NOT EXISTS
	(SELECT *
		FROM shipment
		WHERE supplier.sno =shipment.sno
		AND parts.pno = shipment.pno) and parts.color IN('blue'));
