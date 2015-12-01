\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

-- a) case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -1); -- return 1

select newCustomer(2, 'b', 'bPassword', -1); -- return 2

-- select * from Customers;

/* return:
accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          1 |          1 | a            | aPassword        | open          |        -1
          2 |          2 | b            | bPassword        | open          |        -1
(2 rows)
*/

select * from AccountBalance;

/* return:
 accountnum | balance 
------------+---------
          1 |       0
          2 |       0
(2 rows)
*/

-- b) case: adds CID that appears with status close

insert into Customers (CustomerID, CustomerName, CustomerPassword, AccountStatus, Overdraft)
values(3, 'c', 'cPassword', 'close', -1); -- account num = 3

select newCustomer(3, 'cNew', 'cPasswordNew', -3); -- return 3

--select * from Customers;

/* return:
accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          1 |          1 | a            | aPassword        | open          |        -1
          2 |          2 | b            | bPassword        | open          |        -1
          3 |          3 | cNew         | cPasswordNew     | open          |        -1
(3 rows)
*/ 

select * from AccountBalance;

/* return:
accountnum | balance 
------------+---------
          1 |       0
          2 |       0
          3 |       0
(3 rows)
*/

-- c) case: ads CID that appears with satus open

select newCustomer(1, 'a', 'aPassword', -1); -- return -1

-- no change in the next:

select * from Customers;

/* return:
 accountnum | customerid | customername | customerpassword | accountstatus | overdraft 
------------+------------+--------------+------------------+---------------+-----------
          1 |          1 | a            | aPassword        | open          |        -1
          2 |          2 | b            | bPassword        | open          |        -1
          3 |          3 | cNew         | cPasswordNew     | open          |        -3
(3 rows)
*/ 

select * from AccountBalance;

/* return:
 accountnum | balance 
------------+---------
          1 |       0
          2 |       0
          3 |       0
(3 rows)
*/
 -- drop tables
\i drop.sql;









