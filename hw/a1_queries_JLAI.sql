SELECT name, price, calories
FROM MealItem
ORDER BY price;

SELECT name, price, calories
FROM MealItem
ORDER BY price, calories;

SELECT name, mealType
FROM(MealItem natural join MealMenu)
WHERE mealType='L'; 

SELECT MAX(mealType) 
FROM(SELECT COUNT(itemId),mealType FROM MealMenu Group BY mealType);

UPDATE MealItem
set price= price*1.05
WHERE itemId='1';
SELECT price
FROM MealItem;


SELECT menuID, SUM(ROUND(TO_NUMBER(enddate-startdate))) AS DAYS_ORDERED 
FROM MealOrder
GROUP BY menuID;


UPDATE MealItem
set price=price*.9
WHERE itemId NOT IN(SELECT itemId FROM MealMenu WHERE menuId IN(SELECT menuId FROM MealOrder));

SELECT name, price 
FROM MealItem;

SELECT T.phone, T.acctId, S.acctId
FROM Customer T INNER JOIN Customer S ON T.phone = S.phone 
WHERE S.acctId > T.acctId;




