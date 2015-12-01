\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

-- a) simple case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -1); -- return 1

select newCustomer(2, 'b', 'bPassword', -1); -- return 2

\i closeCustomer.sql;

select closeCustomer(1); -- return 1

--select * from Customers;

/* return:
 accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          2 |          2 | b            | bPassword        | open          |        -1
          1 |          1 | a            | aPassword        | close         |        -1
(2 rows) 
*/ 

select * from AccountBalance;

/* return:
accountnum | balance 
------------+---------
          2 |       0
(1 row)
*/ 

-- b) error case: adds CID that appears with status close and close him

insert into Customers (CustomerID, CustomerName, CustomerPassword, AccountStatus, Overdraft)
values(3, 'c', 'cPassword', 'close', -1); -- account num = 3

select closeCustomer(3); -- return -1

-- no changes:

-- select * from Customers;

/* return:
 accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          2 |          2 | b            | bPassword        | open          |        -1
          1 |          1 | a            | aPassword        | close         |        -1
          3 |          3 | c            | cPassword        | close         |        -1
(3 rows)
*/ 

select * from AccountBalance;

/* return:
 accountnum | balance 
------------+---------
          2 |       0
(1 row)
*/

-- c) checks that all of the tables was deleted

select newCustomer(4, 'd', 'dPassword', -1); -- return 4

insert into Savings (AccountNum, Deposit, DepositDate, NumOfYears, Interest)
values(4, 7, '2001-02-16', 3, 1); 

insert into Top10Customers values(4, 0);

select * from Savings;
/* return:
 savingnum | accountnum | deposit | depositdate | numofyears | interest 
-----------+------------+---------+-------------+------------+----------
         1 |          4 |       7 | 2001-02-16  |          3 |        1
(1 row) 
*/

select * from Top10Customers;
/* return:
 accountnum | balance 
------------+---------
          4 |       0
(1 row)
*/

select closeCustomer(4); -- return 4

-- checks that you deleted 4 id fromAccountBalance, Savings, Top10Customers:

-- select * from Customers;
/* return:
 accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          2 |          2 | b            | bPassword        | open          |        -1
          1 |          1 | a            | aPassword        | close         |        -1
          3 |          3 | c            | cPassword        | close         |        -1
          4 |          4 | d            | dPassword        | close         |        -1
(4 rows) 
*/
 
select * from AccountBalance;
/* return:
 accountnum | balance 
------------+---------
          2 |       0
(1 row) 
*/

select * from Savings;
/* return:
 savingnum | accountnum | deposit | depositdate | numofyears | interest 
-----------+------------+---------+-------------+------------+----------
(0 rows)
*/

select * from Top10Customers;
/* return:
accountnum | balance 
------------+---------
(0 rows)
*/

-- d) error case: close id that not appear in Customers
select closeCustomer(10); -- return 1 

 -- drop tables
\i drop.sql;










