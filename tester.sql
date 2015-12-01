\ir createTables.sql;
\ir helperFunctions.sql;
\ir triggerA.sql;
\ir triggerB.sql;
\ir triggerC.sql;
\ir triggerD.sql;
\ir newCustomer.sql;
\ir closeCustomer.sql;
\ir doAction.sql;
\ir newSaving.sql;
/*select newCustomer(1, 'A', 'whatevs,' current_date, -200);*/
/*
First test
select * from accountbalance;
**Result should be (1,0))**
select * from savings;
**Result should be empty**
select * from actions;
**Result should be empty**
*/


/*select closeCustomer(1);*/
/*
Second test
**Should raise an exception because the accountbalance is non-positive**
*/


/*select doAction(1, 'receive', current_date, 200);*/
/*
Third test
select * from accountbalance;
**Should be (1,200)**
select * from actions;
**Should be (1,1, receive, date, 200)**
select * from top10customers;
**Should be (1,200)**
*/


/*select doAction(1, 'payment' current_date, -500);*/
/*
Fourth test
**Should raise an exception because overdraft has been exceeded**
*/

/*select newSaving(1, 200, current_date, 3, 0.5);*/
/*
Fifth test
select * from savings;
**Should return (1,1, 200, current_date, 3, 0.5)**
select * from actions;
**Should return (2,1, saving, current_date, -200)**
*/

/* select doAction(1, 'receive', '2020-11-29', 200) */
/*
Sixth test
select * from actions;
**Should return (3,1, receive, current_date, 200)**
*/

/* 
select doAction(1, 'payment', current_date, -300);
select closeCustomer(1);
 */
/*
Seventh test
**Exception should be raised**
select * from accountbalance;
**Should return (1, -100)**
select * from actions;
**Last line shouldn't be a closing action**
*/

/*
select newCustomer(2, 'B', 'whatevs', -200);
select newCustomer(3, 'C', 'whatevs', -200);
select newCustomer(4, 'D', 'whatevs', -200);
select newCustomer(5, 'E', 'whatevs', -200);
select newCustomer(6, 'F', 'whatevs', -200);
select newCustomer(7, 'G', 'whatevs', -200);
select newCustomer(8, 'H', 'whatevs', -200);
select newCustomer(9, 'I', 'whatevs', -200);
select newCustomer(10, 'J', 'whatevs', -200);
select newCustomer(11, 'K', 'whatevs', -200);
select newCustomer(12, 'L', 'whatevs', -200);
select newCustomer(13, 'M', 'whatevs', -200);
select newCustomer(14, 'N', 'whatevs', -200);
select newCustomer(15, 'O', 'whatevs', -200);
select newCustomer(16, 'P', 'whatevs', -200);
select newCustomer(17, 'Q', 'whatevs', -200);
select newCustomer(18, 'R', 'whatevs', -200);
select newCustomer(19, 'S', 'whatevs', -200);
select doAction(1, 'receive', current_date, '200');
select doAction(2, 'receive', current_date, '100');
select doAction(3, 'receive', current_date, '100');
select doAction(4, 'receive', current_date, '100');
select doAction(5, 'receive', current_date, '100');
select doAction(6, 'receive', current_date, '100');
select doAction(7, 'receive', current_date, '100');
select doAction(8, 'receive', current_date, '100');
select doAction(9, 'receive', current_date, '100');
select doAction(10, 'receive', current_date, '100');
select doAction(11, 'receive', current_date, '100');
select doAction(12, 'receive', current_date, '100');
select doAction(13, 'receive', current_date, '100');
select doAction(14, 'receive', current_date, '100');
select doAction(15, 'receive', current_date, '50');
select doAction(16, 'receive', current_date, '50');
select doAction(17, 'receive', current_date, '50');
select doAction(18, 'receive', current_date, '50');
select doAction(19, 'receive', current_date, '50');
*/
/*
Last test
select * from top10customers;
**Should return customers 1-14 only**
*/










