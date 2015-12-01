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

-- a) simple case: balance = 0

select closeCustomer(1); -- return 1

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          2 |       0
          3 |       0
(2 rows)
*/ 

-- b) case: positive balance

select doAction(2, 'receive', '2001-02-16', 100); -- return 1

select closeCustomer(2); -- return 2

--select * from Customers;
/* return:
accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          3 |          3 | c            | cPassword        | open          |      -400
          1 |          1 | a            | aPassword        | close         |      -400
          2 |          2 | b            | bPassword        | close         |      -400
(3 rows)
*/

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          3 |       0
(1 row)
*/ 

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          2 | receive    | 2001-02-16 |    100
         2 |          2 | close      | 2015-11-30 |   -100
(2 rows) 
*/

-- c) case: negative balance

select doAction(3, 'payment', '2001-02-16', -10); -- return 3

select closeCustomer(3); -- raise exception

--select * from Customers;
/* return:
accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          3 |          3 | c            | cPassword        | open          |      -400
          1 |          1 | a            | aPassword        | close         |      -400
          2 |          2 | b            | bPassword        | close         |      -400
(3 rows)
*/

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          3 |     -10
(1 row)
*/ 

-- error: id not found in Customers

select closeCustomer(10); -- return -1

-- error: adds CID that appears with status close and newSaving on him

insert into Customers (CustomerID, CustomerName, CustomerPassword, AccountStatus, Overdraft)
values(4, 'd', 'dPassword', 'close', -1); -- account num = 4

select closeCustomer(4); -- return -1

 -- drop tables
\i drop.sql;









