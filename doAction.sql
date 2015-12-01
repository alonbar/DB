create or replace function 
    doAction(CustomerID_ INTEGER, ActionName_ VARCHAR, ActionDate_ DATE, Amount_ REAL)
    returns integer as $$
DECLARE
	id_var integer;
	AccountNum_ integer;
	customer_status varchar;
	ActionNum_ Integer;
BEGIN

	select CustomerID, accountstatus, AccountNum into id_var, customer_status, AccountNum_
	from Customers 
	where CustomerID = CustomerID_;
	
	if NOT FOUND or customer_status = 'close'
		then 
			return -1;
	else 
		insert into Actions (AccountNum, 
							 ActionName, 
							 ActionDate, 
							 Amount) 
					values (AccountNum_, 
							ActionName_,
							ActionDate_,
							 Amount_) returning actionnum into ActionNum_; 
		
		update AccountBalance
		set Balance = Balance + Amount_
		where AccountNum = AccountNum_;
		return ActionNum_;
	end if;
	
END;
$$ language plpgsql 

