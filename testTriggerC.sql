\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

-- a) simple case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -400); -- return 1

select newCustomer(2, 'b', 'bPassword', -400); -- return 2

select newCustomer(3, 'c', 'cPassword', -400); -- return 3

\i closeCustomer.sql;

\i doAction.sql;

\i newSaving.sql;

\i triggerA.sql;

\i triggerB.sql;

\i triggerC.sql;

-- a) simple case: given date is CURRENT_DATE

select doAction(1, 'receive', CURRENT_DATE, 400); -- return 1

select newSaving(1, 40, CURRENT_DATE, 3, 1); -- return 1

--select * from Customers;
/* return:
 accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          1 |          1 | a            | aPassword        | open          |      -400
          2 |          2 | b            | bPassword        | open          |      -400
          3 |          3 | c            | cPassword        | open          |      -400
(3 rows)
*/

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          2 |       0
          3 |       0
          1 |     360
(3 rows)
*/ 

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | receive    | 2015-11-30 |    400
         2 |          1 | saving     | 2015-11-30 |    -40
(2 rows)
*/

select * from  Savings;
/* return:
 savingnum | accountnum | deposit | depositdate | numofyears | interest 
-----------+------------+---------+-------------+------------+----------
         1 |          1 |      40 | 2015-11-30  |          3 |        1
(1 row)
*/

-- b) complex case: given date is not CURRENT_DATE

select doAction(2, 'receive', '2001-02-16', 400); -- return 3

select newSaving(2, 40, '2001-02-16', 3, 1); -- return 2

--select * from Customers;
/* return:
 accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          1 |          1 | a            | aPassword        | open          |      -400
          2 |          2 | b            | bPassword        | open          |      -400
          3 |          3 | c            | cPassword        | open          |      -400
(3 rows)
*/

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          3 |       0
          1 |     360
          2 |     360
(3 rows)
*/ 

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | receive    | 2015-11-30 |    400
         2 |          1 | saving     | 2015-11-30 |    -40
         3 |          2 | receive    | 2015-11-30 |    400
         4 |          2 | saving     | 2015-11-30 |    -40
(4 rows)
*/

select * from  Savings;
/* return:
 savingnum | accountnum | deposit | depositdate | numofyears | interest 
-----------+------------+---------+-------------+------------+----------
         1 |          1 |      40 | 2015-11-30  |          3 |        1
         2 |          2 |      40 | 2015-11-30  |          3 |        1
(2 rows)
*/

 -- drop tables
\i drop.sql;









