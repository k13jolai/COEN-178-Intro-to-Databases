--A) When inserted into bankcust_6, the following triggers are fired:
--insert_total_trig
INSERT INTO bankcust_6 VALUES('8','Jessie','Stoneridge','SJ');
INSERT INTO bankcust_6 VALUES('9','James','El Camino','SF');
--B) When the following values are inserted into accounts_6, the following triggers are fired:
--display_account_trig
--display_account_trig_full
--update_totals
INSERT INTO accounts_6 VALUES('10','Checking',300,'8');
INSERT INTO accounts_6 VALUES('11','Checking',200,'9');

--C) When the following values are inserted into billpay_6, the following triggers are fired:
--update_acccouns_trig
INSERT INTO billpay_6 VALUES('2','8','10',100);
INSERT INTO billpay_6 VALUES('3','9','11',100);