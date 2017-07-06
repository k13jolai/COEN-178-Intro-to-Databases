SQL> SELECT * FROM mealitem;

IT NAME                 PRICE   CALORIES                                        
-- --------------- ---------- ----------                                        
1  oatmeal                  3        120                                        
2  fruit_plate              8        220                                        
3  steak                   20        420                                        
4  chicken pie              9        350                                        
5  broccoli pie            10        200                                        
6  noodles                  3        200                                        
7  chips                    1        180                                        

7 rows selected.

SQL> SELECT * FROM mealMenu;

ME IT M                                                                         
-- -- -                                                                         
M1 1  B                                                                         
M2 2  L                                                                         
M3 3  L                                                                         
M4 4  D                                                                         
M5 5  D                                                                         
M6 6  L                                                                         
M7 7  L                                                                         

7 rows selected.

SQL> SELECT * FROM Customer;

ACC NAME       PHONE                                                            
--- ---------- ----------                                                       
A1  Smith      4085551212                                                       
A4  Jones      4085554444                                                       
A2  Clark      4083331212                                                       
A6  Chen       4086661212                                                       
A9  Mayer      4086661212                                                       
A10 Smith      4085551212                                                       
A8  Lai        4084828740                                                       
A7  Yu         4085551222                                                       

8 rows selected.

SQL> SELECT * FROM Mealorder;

ACC ME STARTDATE ENDDATE                                                        
--- -- --------- ---------                                                      
A1  M1 10-JAN-16 16-JAN-16                                                      
A1  M2 10-JAN-16 16-JAN-16                                                      
A2  M3 10-FEB-16 26-FEB-16                                                      
A2  M1 11-MAR-16 26-MAR-16                                                      
A4  M5 07-APR-16 07-MAY-16                                                      
A8  M6 10-JAN-16 11-JAN-16                                                      
A1  M4 10-JAN-16 16-JAN-16                                                      
A7  M1 10-JAN-16 16-JAN-16                                                      
A7  M5 10-JAN-16 16-JAN-16                                                      
A2  M3 10-FEB-16 26-FEB-16                                                      
A7  M6 10-JAN-16 11-JAN-16                                                      

ACC ME STARTDATE ENDDATE                                                        
--- -- --------- ---------                                                      
A7  M7 10-JAN-16 11-JAN-16                                                      
A1  M1 10-JAN-16 16-JAN-16                                                      

13 rows selected.

SQL> execute addMealOrder('A1','M1',TO_DATE('2016/01/10','yyyy/mm/dd'), TO_DATE('2016-01-16', 'yyyy/mm/dd'));

PL/SQL procedure successfully completed.

SQL> SELECT * FROM MealOrder;

ACC ME STARTDATE ENDDATE                                                        
--- -- --------- ---------                                                      
A1  M1 10-JAN-16 16-JAN-16                                                      
A1  M2 10-JAN-16 16-JAN-16                                                      
A2  M3 10-FEB-16 26-FEB-16                                                      
A2  M1 11-MAR-16 26-MAR-16                                                      
A4  M5 07-APR-16 07-MAY-16                                                      
A8  M6 10-JAN-16 11-JAN-16                                                      
A1  M4 10-JAN-16 16-JAN-16                                                      
A7  M1 10-JAN-16 16-JAN-16                                                      
A7  M5 10-JAN-16 16-JAN-16                                                      
A2  M3 10-FEB-16 26-FEB-16                                                      
A7  M6 10-JAN-16 11-JAN-16                                                      

ACC ME STARTDATE ENDDATE                                                        
--- -- --------- ---------                                                      
A7  M7 10-JAN-16 11-JAN-16                                                      
A1  M1 10-JAN-16 16-JAN-16                                                      
A1  M1 10-JAN-16 16-JAN-16                                                      

14 rows selected.

SQL> SELECT mostMealOrders FROM DUAL;

MOSTMEALORDERS                                                                  
--------------------------------------------------------------------------------
 name:Smith      phone: 4085551212                                              
                                                                                
                                                                                

SQL> DELETE FROM MealOrder
  2  WHERE acctid='A2';

3 rows deleted.

SQL> DELETE FROM MealOrder
  2  WHERE acctid='A8';

1 row deleted.

SQL> SELECT * FROM CancelledOrders;

ACC ME STARTDATE ENDDATE                                                        
--- -- --------- ---------                                                      
A7  M7 10-JAN-16 11-JAN-16                                                      
A2  M3 10-FEB-16 26-FEB-16                                                      
A2  M1 11-MAR-16 26-MAR-16                                                      
A2  M3 10-FEB-16 26-FEB-16                                                      
A8  M6 10-JAN-16 11-JAN-16                                                      

SQL> SELECT mostCancelled FROM DUAL;

MOSTCANCELLED                                                                   
--------------------------------------------------------------------------------
 name:Clark      phone: 4083331212                                              
                                                                                
                                                                                

SQL> spool off;
