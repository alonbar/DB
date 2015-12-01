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

-- a) simple case: balance not below overdraft

select doAction(1, 'payment', '2001-02-16', -100); -- return 1

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
          1 |    -100
*/ 

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | payment    | 2001-02-16 |   -100
(1 row)
*/

-- b) complex case: balance is below overdraft

select doAction(1, 'payment', '2001-02-16', -500); -- raise exception

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
          1 |    -100
*/ 

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | payment    | 2001-02-16 |   -100
(1 row)
*/

 -- drop tables
\i drop.sql;









