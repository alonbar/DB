delete from Top10Customers;
insert into Top10Customers
select * from AccountBalance where balance in (select Balance 
											   from AccountBalance 
											   where balance > 0
											   order by balance desc
												limit 10);
