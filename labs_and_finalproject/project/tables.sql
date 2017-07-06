
CREATE TABLE Status(
	statuscode VARCHAR(15) PRIMARY KEY,
	problem VARCHAR(60)
);

CREATE TABLE Status_RepairJob(
	code VARCHAR(15) REFERENCES Status(statuscode),
	repairid VARCHAR(15) REFERENCES RepairJob(repairid),
	PRIMARY KEY(code,repairid)
);
CREATE TABLE Machine(
	machineid VARCHAR(15) PRIMARY KEY,
	model VARCHAR(15),
	Periph SMALLINT
);

CREATE TABLE Cust(
	customerid VARCHAR(15) PRIMARY KEY,
	customername VARCHAR(15),
	contactinfo VARCHAR(20)
);

CREATE TABLE Warranty(
	contractid VARCHAR(15) PRIMARY KEY,
	customerid VARCHAR(15) REFERENCES Cust(customerid),
	machineid VARCHAR(15)  REFERENCES Machine(machineid),
	beginDate DATE,
	endDate DATE
);


CREATE TABLE CLUSTERS(
	groupid VARCHAR(15) PRIMARY KEY,
	numberofmachines VARCHAR(5)
);

CREATE TABLE ServiceItem(
	ServiceItemId VARCHAR(15) PRIMARY KEY,
	groupid VARCHAR(15) REFERENCES CLUSTERS(groupid),
	machineid VARCHAR(15) REFERENCES Machine(machineid)	
);

CREATE TABLE CLUSTERMACHINE(
	clusterid VARCHAR(15) REFERENCES CLUSTERS(groupid),
	machineid VARCHAR(15) REFERENCES Machine(machineid),
	PRIMARY KEY(clusterid,machineid)
);
CREATE TABLE ServiceContract(
	contractid VARCHAR(15) PRIMARY KEY,
	customerid VARCHAR(15)  REFERENCES Cust(customerid),
	startDate DATE,
	endDate DATE,
	serviceitemreference VARCHAR(15),
	typeofcoverage VARCHAR(15)
);

CREATE TABLE ServiceLineItem(
	itemID VARCHAR(15) PRIMARY KEY,
	serviceitemreference VARCHAR(15),
	contractid VARCHAR(15) REFERENCES ServiceContract(contractid)
);

CREATE TABLE RepairPerson(
	employeeno VARCHAR(15) PRIMARY KEY,
	employeename VARCHAR(15),
	employeephone VARCHAR(15) 
);

CREATE TABLE RepairJob(
	repairid VARCHAR(15) PRIMARY KEY,
	machineid VARCHAR(15)  REFERENCES Machine(machineid),
	customerid VARCHAR(15) REFERENCES Cust(customerid),
	employeeno VARCHAR(15) REFERENCES RepairPerson(employeeno),
	stat INTEGER,
	hours INTEGER,
	parts_used VARCHAR(15),
	parts_cost DECIMAL(7,2),
	timein DATE,
	timeout DATE, 
	warranty SMALLINT
);
/*Billid is now referenced to repairjob via repairid*/
CREATE TABLE CustomerBill(
	billid  VARCHAR(15) PRIMARY KEY,
	repairid VARCHAR(15) REFERENCES RepairJob(repairid),
	amount DECIMAL(7,2),
	cost DECIMAL(7,2),
	warrantycost DECIMAL(7,2)
);


