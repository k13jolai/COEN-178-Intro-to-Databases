SELECT SUM(amount) FROM CustomerBill INNER JOIN RepairJob
		ON CustomerBill.repairid = RepairJob.repairid
		WHERE WarrantyCost!=0 AND stat=4
	   	AND
		timeout BETWEEN TO_DATE('2016-2-12', 'yyyy/mm/dd') AND
		TO_DATE('2016-12-12', 'yyyy/mm/dd');


