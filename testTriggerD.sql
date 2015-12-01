\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

\i closeCustomer.sql;

\i doAction.sql;

\i newSaving.sql;

\i triggerA.sql;

\i triggerB.sql;

\i triggerC.sql;

\i triggerD.sql;

-- a) simple case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -400); -- return 1

select newCustomer(2, 'b', 'bPassword', -400); -- return 2

select newCustomer(3, 'c', 'cPassword', -400); -- return 3

select newCustomer(4, 'd', 'dPassword', -400); -- return 4

select newCustomer(5, 'e', 'ePassword', -400); -- return 5

select newCustomer(6, 'f', 'fPassword', -400); -- return 6

select newCustomer(7, 'g', 'gPassword', -400); -- return 7

select newCustomer(8, 'h', 'hPassword', -400); -- return 8

select newCustomer(9, 'i', 'iPassword', -400); -- return 9

select * from Top10Customers;
/* return:
 accountnum | balance 
------------+---------
(0 rows)
*/

-- adds to balance

select doAction(1, 'receive', CURRENT_DATE, 400); -- return 1
--'2001-02-16'
select doAction(2, 'receive', CURRENT_DATE, 400); -- return 2

select doAction(3, 'receive', CURRENT_DATE, 400); -- return 3

select doAction(4, 'receive', CURRENT_DATE, 400); -- return 4

select doAction(5, 'receive', CURRENT_DATE, 400); -- return 5

select doAction(6, 'receive', '2001-02-16', 400); -- return 6

select doAction(7, 'receive', '2001-02-16', 400); -- return 7

select doAction(8, 'receive', '2001-02-16', 400); -- return 8

select doAction(9, 'receive', '2001-02-16', 300); -- return 9

select * from Top10Customers;
/* return:
 accountnum | balance 
------------+---------
          1 |     400
          2 |     400
          3 |     400
          4 |     400
          5 |     400
          6 |     400
          7 |     400
          8 |     400
          9 |     300
(9 rows)
*/

select newCustomer(10, 'j', 'jPassword', -400); -- return 10

select doAction(10, 'receive', '2001-02-16', 200); -- return 10

select * from Top10Customers;
/* return:
 accountnum | balance 
------------+---------
          1 |     400
          2 |     400
          3 |     400
          4 |     400
          5 |     400
          6 |     400
          7 |     400
          8 |     400
          9 |     300
         10 |     200
(10 rows)
*/

-- b) complex case: adds new Customer with many balance

select newCustomer(11, 'j', 'jPassword', -400); -- return 11

select doAction(11, 'receive', CURRENT_DATE, 800); -- return 11

select * from Top10Customers;
/* return: TODO: fix it
 accountnum | balance 
------------+---------
          1 |     400
          2 |     400
          3 |     400
          4 |     400
          5 |     400
          6 |     400
          7 |     400
          8 |     400
          9 |     300
         11 |     800
(10 rows)
*/

-- c) complex case: delete one Customer (id 8) 

select closeCustomer(8); -- return 8

select * from Top10Customers;
/* return:
 accountnum | balance 
------------+---------
          1 |     400
          2 |     400
          3 |     400
          4 |     400
          5 |     400
          6 |     400
          7 |     400
          9 |     300
         10 |     200
         11 |     800
(10 rows)
*/

-- d) complex case: payment case

select newCustomer(12, 'k', 'kPassword', -400); -- return 12

select newCustomer(13, 'k', 'kPassword', -400); -- return 13

select doAction(12, 'receive', CURRENT_DATE, 10); -- return 13

-- payment
select doAction(10, 'payment', '2001-02-16', -199); -- return 14

select * from Top10Customers;
/* return:
 accountnum | balance 
------------+---------
          1 |     400
          2 |     400
          3 |     400
          4 |     400
          5 |     400
          6 |     400
          7 |     400
          9 |     300
         11 |     800
         12 |      10
(10 rows)
*/

--select * from Actions;
/* return:
 actionnum | accountnum | actionname | actiondate | amount 
-----------+------------+------------+------------+--------
         1 |          1 | receive    | 2015-12-01 |    400
         2 |          2 | receive    | 2015-12-01 |    400
         3 |          3 | receive    | 2015-12-01 |    400
         4 |          4 | receive    | 2015-12-01 |    400
         5 |          5 | receive    | 2015-12-01 |    400
         6 |          6 | receive    | 2015-12-01 |    400
         7 |          7 | receive    | 2015-12-01 |    400
         8 |          8 | receive    | 2015-12-01 |    400
         9 |          9 | receive    | 2015-12-01 |    300
        10 |         10 | receive    | 2015-12-01 |    200
        11 |         11 | receive    | 2015-12-01 |    800
        12 |          8 | close      | 2015-12-01 |   -400
        13 |         12 | receive    | 2015-12-01 |     10
        14 |         10 | payment    | 2015-12-01 |   -199
(14 rows)
*/

 -- drop tables
\i drop.sql;

