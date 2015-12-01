CREATE OR REPLACE FUNCTION triggerDFunc() RETURNS TRIGGER AS $$ 
BEGIN
	
	delete from Top10Customers;
	insert into Top10Customers
	select * from AccountBalance where balance in (select Balance 
											   from AccountBalance 
											   where balance > 0
											   order by balance desc
												limit 10);
    return NULL;  
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER triggerD on AccountBalance;

CREATE TRIGGER triggerD
after insert or update or delete on AccountBalance
FOR EACH ROW execute procedure triggerDFunc();
