\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

-- a) simple case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -400); -- return 1

select newCustomer(2, 'b', 'bPassword', -400); -- return 2

\i closeCustomer.sql;

\i doAction.sql;

\i newSaving.sql;

select doAction(1, 'receive', '2001-02-16', 100); -- return 1

select newSaving(1, 40, '2001-02-16', 3, 1); -- return 1

select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          2 |       0
          1 |      60
(2 rows) 
*/

select * from  Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | receive    | 2001-02-16 |    100
         2 |          1 | saving     | 2001-02-16 |    -40
(2 rows)
*/

select * from  Savings;
/* return:
 savingnum | accountnum | deposit | depositdate | numofyears | interest 
-----------+------------+---------+-------------+------------+----------
         1 |          1 |      40 | 2001-02-16  |          3 |        1
(1 row)
*/

-- error: id not found in Customers

select newSaving(10, 40, '2001-02-16', 3, 1); -- return -1

-- error: adds CID that appears with status close and newSaving on him

insert into Customers (CustomerID, CustomerName, CustomerPassword, AccountStatus, Overdraft)
values(3, 'c', 'cPassword', 'close', -1); -- account num = 3

select newSaving(3, 40, '2001-02-16', 3, 1); -- return -1

 -- drop tables
\i drop.sql;









