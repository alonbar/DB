CREATE OR REPLACE FUNCTION tirggerAFunc() RETURNS TRIGGER AS $$ 
	DECLARE
		CustomerID_ INTEGER;
		AccountNum_ INTEGER;
	BEGIN
	 if OLD.Balance > 0 
		then 
			select CustomerID, AccountNum into CustomerID_ , AccountNum_
			from Customers
			where AccountNum = OLD.AccountNum;
			perform doAction(CustomerID_, 'close', CURRENT_DATE, -(OLD.BALANCE));
			delete from AccountBalance where AccountNum = OLD.AccountNum;
			return new;
	elsif OLD.Balance = 0
		then
		select CustomerID, AccountNum into CustomerID_ , AccountNum_
		from Customers
		where AccountNum = OLD.AccountNum;
		delete from AccountBalance where AccountNum = OLD.AccountNum;
		return new;
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
