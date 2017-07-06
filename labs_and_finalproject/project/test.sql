SELECT contractid FROM warranty WHERE contractid='01' AND 
TO_DATE('2016-11-20', 'yyyy/mm/dd') BETWEEN begindate and Enddate;
