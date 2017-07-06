CREATE TABLE MealItem(
	itemId CHAR(2) PRIMARY KEY,
	name CHAR(15),
	price FLOAT(2),
	calories INTEGER,
	CONSTRAINT max_cal
	CHECK(calories<500)
);

CREATE TABLE MealMenu(
	menuId CHAR(2) PRIMARY KEY,
	itemId CHAR(2),
	FOREIGN KEY(itemId) REFERENCES MealItem(itemId),
	mealType CHAR(1),
	CONSTRAINT Type_of_meal
	CHECK(mealType IN('B','L','D'))
);

CREATE TABLE Customer(
	acctId CHAR(3) PRIMARY KEY,
	name CHAR(10),
	phone CHAR(10)
);

CREATE TABLE MealOrder(
	acctId CHAR(3),
	FOREIGN KEY(acctId) REFERENCES Customer(acctId),
	menuId CHAR(2),
	FOREIGN KEY(menuId) REFERENCES MealMenu(menuId),
	startDate DATE,
	endDate DATE
);
/* CHANGES MADE: No PRIMARY KEY for MealOrder because acctId and menuId cannot be primary keys at same time
Also, would receive error when adding A1 and A2 more than once to table. */
