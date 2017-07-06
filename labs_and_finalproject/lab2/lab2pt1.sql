CREATE TABLE Customer(
	custid char(4),
	firstname char(10),
	lastname char(15),
	city char(10), PRIMARY KEY(custid)
);

CREATE TABLE DeliveryService(
	serviceid char(10),
	item char(15),
	location char(15),
	servicefee decimal(4,2), PRIMARY KEY(serviceid)
);

CREATE TABLE Schedule(
	serviceid char(10),
	FOREIGN KEY(serviceid) REFERENCES DeliveryService(serviceid),
	custid char(4),
	FOREIGN KEY(custid) REFERENCES Customer(custid),
	day char(1),
	CONSTRAINT dayConstraint
	CHECK(day IN('m','t','w','r','f'))
);

INSERT INTO Customer VALUES('c1','John','Smith','SJ');
INSERT INTO Customer VALUES('c2','Mary','Jones','SFO');
INSERT INTO Customer VALUES('a1','Vincent','Chen','LA');

INSERT INTO DeliveryService VALUES('dsg1','grocery','SJ',25.0);
INSERT INTO DeliveryService VALUES('dsb1','books','SJ',10.0);
INSERT INTO DeliveryService VALUES('dsm2','movies','LA',15.0);

INSERT INTO Schedule VALUES('dsg1','c1','m');
INSERT INTO Schedule VALUES('dsb1','a1','w');
INSERT INTO Schedule VALUES('dsm2','c2','f');

