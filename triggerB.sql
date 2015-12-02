CREATE OR REPLACE FUNCTION tirggerBFunc() RETURNS TRIGGER AS $$ 
	DECLARE
		CustomerID_ INTEGER;
		OverDraft_ REAL;
	BEGIN
	select CustomerID, Overdraft into CustomerID_, Overdraft_
	from Customers
	where AccountNum = OLD.AccountNum; 
	 if NEW.Balance < Overdraft_
		then 
			/*raise notice 'new balance: % allowed overDraft: %',NEW.balance, Overdraft_;*/
			RAISE EXCEPTION 'Customer % cant have balance lower than %',CustomerID_, Overdraft_;
	else 
		return NEW;
	end if;
			
    return new;  
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER triggerB
BEFORE update on AccountBalance
FOR EACH ROW execute procedure tirggerBFunc();
