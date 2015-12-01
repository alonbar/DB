\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

-- a) simple case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -400); -- return 1

select newCustomer(2, 'b', 'bPassword', -400); -- return 2

\i closeCustomer.sql;

\i doAction.sql;

-- receive case

select doAction(1, 'receive', '2001-02-16', 100); -- return 1

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          2 |       0
          1 |     100
(2 rows)
*/

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | receive    | 2001-02-16 |    100
(1 row)
*/

-- payment case

select doAction(2, 'payment', '2001-02-16', -100); -- return 2

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          1 |     100
          2 |    -100
(2 rows)
*/

select * from  Actions;
/* return:
actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | receive    | 2001-02-16 |    100
         2 |          2 | payment    | 2001-02-16 |   -100
(2 rows)
*/

-- error: id not found in Customers

select doAction(10, 'receive', '2001-02-16', 100); -- return -1

-- error: adds CID that appears with status close and doAction on him

insert into Customers (CustomerID, CustomerName, CustomerPassword, AccountStatus, Overdraft)
values(3, 'c', 'cPassword', 'close', -1); -- account num = 3

select doAction(3, 'receive', '2001-02-16', 100); -- return -1

 -- drop tables
\i drop.sql;









