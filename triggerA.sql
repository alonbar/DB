CREATE OR REPLACE FUNCTION tirggerAFunc() RETURNS TRIGGER AS $$ 
	DECLARE
		CustomerID_ INTEGER;
	BEGIN
	 if OLD.Balance >= 0 
		then 
			select CustomerID into CustomerID_
			from Customers
			where AccountNum = OLD.AccountNum;
			if OLD.Balance = 0
				then 
					return old;
			end if;
			insert into Actions (AccountNum, 
							 ActionName, 
							 ActionDate, 
							 Amount) 
					values (OLD.AccountNum, 
							 'close', 
							 CURRENT_DATE, 
							 -OLD.Balance); 
			return old;
	else
		RAISE EXCEPTION 'Cannot delete AccountNum % with negative balance %',OLD.AccountNum, OLD.balance; 
	end if;
			
    return new;  
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER TRIGGERA on ACCOUNTBALANCE;

CREATE TRIGGER triggerA
BEFORE delete on AccountBalance
FOR EACH ROW execute procedure tirggerAFunc();
