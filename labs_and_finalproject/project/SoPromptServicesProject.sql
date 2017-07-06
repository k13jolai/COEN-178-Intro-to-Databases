DROP TABLE Service_Contract;
DROP TABLE Repair_Job;
DROP TABLE Customer;
DROP TABLE Machine;
DROP TABLE Repair_Person;
DROP TABLE Problem;
DROP TABLE Warranty;
DROP TABLE Service_Line_Item;
DROP TABLE Service_Item;
DROP TABLE MyCluster;
DROP TABLE Bill;
DROP TABLE Problem_Repair_Job;


CREATE TABLE Service_Contract (
  ContractID         varchar2(15) NOT NULL,
  CustomerID         varchar2(15) NOT NULL,
  ItemID             varchar2(15),
  Begin_date         date,
  End_date           date,
  Type_of_Coverage varchar2(20),
  PRIMARY KEY (ContractID));
CREATE TABLE Repair_Job (
  RepairID    varchar2(15) NOT NULL,
  MACHINEID  varchar2(15) NOT NULL,
  Time_in     date,
  Time_out    date,
  EmployeeID  varchar2(15) NOT NULL,
  Status      number(1),
  Labor_Hours number(10),
  Parts_used  varchar2(20),
  Parts_Cost  number(10),
  TotalCost   number(10),
  CustomerID  varchar2(15) NOT NULL,
  BillID      varchar2(15) NOT NULL,
  WarrantyCost number(10),
  PRIMARY KEY (RepairID));
CREATE TABLE Customer (
  CustomerID  varchar2(15) NOT NULL,
  Name        varchar2(20),
  Email_Phone varchar2(30),
  PRIMARY KEY (CustomerID));
CREATE TABLE Machine (
  MachineID    varchar2(15) NOT NULL,
  Model_Make   varchar2(20),
  PeriphORComp number(1), -- Periph = 0, Comp = 1
  PRIMARY KEY (MachineID));
CREATE TABLE Repair_Person (
  EmployeeID varchar2(15) NOT NULL,
  Name       varchar2(20),
  Phone      varchar2(30),
  PRIMARY KEY (EmployeeID));
CREATE TABLE Problem (
  ProblemID   varchar2(15) NOT NULL,
  Name        varchar2(20),
  Description varchar2(50),
  PRIMARY KEY (ProblemID));
CREATE TABLE Warranty (
  ContractID varchar2(15) NOT NULL,
  MachineID  varchar2(15),
  BeginDate  date,
  EndDate    date,
  PRIMARY KEY (ContractID));
CREATE TABLE Service_Line_Item (
  ItemID        varchar2(15) NOT NULL,
  ServiceItemID varchar2(15),
  ContractID    varchar2(15) NOT NULL,
  PRIMARY KEY (ItemID));
CREATE TABLE Service_Item (
  ServiceItemId             varchar2(15) NOT NULL,
  MyClusterID                   varchar2(15),
  MachineID                 varchar2(15),
  Service_Line_ItemItemID varchar2(15) NOT NULL);
CREATE TABLE MyCluster (
  MyClusterID       varchar2(15) NOT NULL,
  NumofMachines number(10));
CREATE TABLE MyCluster_Machine (
  MyClusterID       varchar2(15) NOT NULL,
  MachineID     varchar2(15) NOT NULL,
  PRIMARY KEY (MyClusterID, MachineID));
CREATE TABLE Bill (
  BillID   varchar2(15) NOT NULL,
  RepairID varchar2(15),
  PRIMARY KEY (BillID));
CREATE TABLE Problem_Repair_Job (
  Repair_JobRepairID varchar2(15) NOT NULL,
  ProblemProblemID     varchar2(15) NOT NULL,
  PRIMARY KEY (Repair_JobRepairID,
  ProblemProblemID));
ALTER TABLE Warranty ADD CONSTRAINT FKWarranty476847 FOREIGN KEY (MachineID) REFERENCES Machine (MachineID);
ALTER TABLE Service_Item ADD CONSTRAINT FKMachine68663 FOREIGN KEY (MachineID) REFERENCES Machine (MachineID);
ALTER TABLE Repair_Job ADD CONSTRAINT FKRepair_Job187922 FOREIGN KEY (EmployeeID) REFERENCES Repair_Person (EmployeeID);
ALTER TABLE Repair_Job ADD CONSTRAINT FKRepair_Job632079 FOREIGN KEY (BillID) REFERENCES Bill (BillID);
ALTER TABLE Problem_Repair_Job ADD CONSTRAINT FKProblem_Re206364 FOREIGN KEY (ProblemProblemID) REFERENCES Problem (ProblemID);
ALTER TABLE Problem_Repair_Job ADD CONSTRAINT FKProblem_Re480858 FOREIGN KEY (Repair_JobRepairID) REFERENCES Repair_Job (RepairID);
ALTER TABLE Service_Contract ADD CONSTRAINT FKService_Co372277 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Repair_Job ADD CONSTRAINT FKRepair_Job11782 FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID);
ALTER TABLE Repair_Job ADD CONSTRAINT FKRepair_Job882888 FOREIGN KEY (MACHINEID) REFERENCES Machine (MachineID);
ALTER TABLE Service_Line_Item ADD CONSTRAINT FKService_Li970558 FOREIGN KEY (ContractID) REFERENCES Service_Contract (ContractID);
ALTER TABLE Service_Item ADD CONSTRAINT FKService_It778193 FOREIGN KEY (Service_Line_ItemItemID) REFERENCES Service_Line_Item (ItemID);
ALTER TABLE MyCluster_Machine ADD CONSTRAINT FKMyCluster_Machine1 FOREIGN KEY (MyClusterID) REFERENCES MyCluster (MyClusterID);
ALTER TABLE MyCluster_Machine ADD CONSTRAINT FKMyCluster_Machine2 FOREIGN KEY (MachineID) REFERENCES Machine (MachineID);


-- Some Functions

--Solve for totalcost
--Put this in a function and call it before calling 5. and 7. , and after calling 3.
--
--How many computers?
--SELECT count(*) INTO Comps
--FROM Machine
--WHERE PeriphORComp == 1;
--
--How many peripherials?
--SELECT count(*) INTO Periphs
--FROM Machine
--WHERE PeriphORComp == 0;
--
--How many months between?
--SELECT MONTHS_BETWEEN (Time_in, Time_out) INTO Months
--FROM Repair_Job
--WHERE CustomerID == newCustomerID;
--
--SELECT Parts_Cost, Labor_Hours INTO pcost, hours
--FROM Repair_Job
--WHERE CustomerID == newCustomerID;
--
--If they have a warranty
--var totaltemp;
--totaltemp = pcost + (((Comps * 50)+ (Periphs*20))*Months) + 50 + (25 * hours);
--IF EXISTS (
--  SELECT * FROM Warranty WHERE Machine_ID ==
--     (SELECT Machine_ID FROM Repair_Job WHERE CustomerID == newCustomerID);
--)
--BEGIN
--  UPDATE WarrantyCost
--  SET WarrantyCost = totaltemp
--  WHERE CustomerID == newCustomerID;
--  UPDATE Repair_Job
--  SET TotalCost = 0
--  WHERE CustomerID == newCustomerID;
--END
--ELSE
--BEGIN
--  UPDATE Repair_Job
--  SET TotalCost = totaltemp
--  WHERE CustomerID == newCustomerID;
--  UPDATE WarrantyCost
--  SET WarrantyCost = 0
--  WHERE CustomerID == newCustomerID;
--END



-- 1. Create a Warranty
--get values ContractID, MachineID, Start xxxx-xx-xx, End yyyy-yy-yy
--INSERT INTO Warranty VALUES (ContractID, MachineID, date 'xxxx-xx-xx', date 'yyyy-yy-yy');

--2. Create a Repair_Job
--get values RepairID, MachineID, Model_Make, CustomerID, Customername, Email_Phone, TimeIn, Status, EmployeeID, WarrantyNo, Problems (Multiple boxes, array)
--preconditions: EmployeeID already defined, ProblemID already defined, list of valid warranty numbers defined (warrantylist)
--WarrantyList consists of this format, an array containing 3 values: warrantynumber, startdate, enddate
--(['W1', date xxxx-xx-xx, date yyyy-yy-yy], ['W2', date xxxx-xx-xx, date yyyy-yy-yy], ...)
--INSERT INTO Machine VALUES (MachineID, Model_Make, 0 if periph 1 if comp);
--INSERT INTO Customer VALUES (CustomerID, Customername, Email_Phone);
--concatinate a B in front of the repairID for new BillID (ex. RepairID = 'R4', BillID = 'BR4')
--INSERT INTO Bill VALUES (BillID, RepairID)
--INSERT INTO Repair_Job VALUES (RepairID, MachineID, TimeIn, NULL, EmployeeID, Status, Labor_Hours, Parts_used, Parts_Cost, 0, CustomerID, BillID, 0);
--below is test code in javascript for warranty
--var flag = 0;
--for (var i = 0; i < warrantylist.length; i++){
--  if(warrantylist[i].indexOf(WarrantyNo) != -1){
--    var tempstart = warrantylist[i][1];
--    var tempend = warrantylist[i][2];
--    if ((TimeIn >= startdate) && (TimeIn <= enddate)){
--        flag = 1;
--        INSERT INTO Warranty VALUES (WarrantyNo, MachineID, date tempstart, date tempend);
--    }
--  }
--}
--if (flag == 0){
--  echo "Not a valid warranty. You will be charged full price."
--}

--3. Update Machine Status
--get values newRepairID, newStatus, newTimeOut, newLabor_Hours, newParts_used, newParts_Cost
--UPDATE Repair_Job
--SET Status=newStatus, Time_out=newTimeOut, Labor_Hours=newLabor_Hours, Parts_used=newParts_used, Parts_Cost=newParts_Cost
--WHERE RepairID==newRepairID;

--4. Show Machine Status
--get newMachineID or phone/Email
--if newMachineID
--SELECT Status
--FROM Repair_Job
--WHERE MachineID == newMachineID;
--
--if phone/Email
--SELECT Status
--FROM Repair_Job Natural Join Customer
--WHERE phone/Email == Email_Phone;

--5. Show Billing
--get newCustomerID
--each value can be displayed individually, so there will be multiple select statements
--
--SELECT Name
--FROM Customer
--WHERE CustomerID == newCustomerID;
--
--SELECT Email_Phone
--FROM Customer
--WHERE CustomerID == newCustomerID;
--
--SELECT Model_Make
--FROM Machine Natural Join Repair_Job
--WHERE CustomerID == newCustomerID;
--
--SELECT Time_in
--FROM Repair_Job
--WHERE CustomerID == newCustomerID;
--
--SELECT Time_out
--FROM Repair_Job
--WHERE CustomerID == newCustomerID;
--
--SELECT RepairID into TempRep
--FROM Repair_Job
--WHERE CustomerID == newCustomerID;
--
--SELECT name, Description
--FROM Problem_Repair_Job Natural Join Problem
--WHERE TempRep == Repair_JobRepairID;
--
--SELECT Parts_used, Parts_Cost
--FROM Repair_Job
--WHERE CustomerID == newCustomerID;
--
--SELECT TotalCost FROM Repair_Job WHERE CustomerID == newCustomerID;


--6. Show Repair Jobs
--SELECT RepairID
--FROM Repair_Job
--WHERE Status == 1 OR Status == 2;

--7. Show Revenue Generated
--get Datestart, Dateend
--
--Not covered by Warranty
--SELECT SUM(TotalCost) INTO NotCovered
--FROM Repair_Job
--WHERE Status == 4;
--
--SELECT SUM(WarrantyCost) INTO Covered
--FROM Repair_Job
--WHERE Status == 4;
