create or replace function 
    closeCustomer(CustomerID_ INTEGER) 
    returns integer as $$
DECLARE
	id_var integer;
	AccountNum_ integer;
	customer_status varchar;
BEGIN

	select CustomerID, accountstatus, AccountNum into id_var, customer_status, AccountNum_
	from Customers 
	where CustomerID = CustomerID_;
	
	if NOT FOUND or customer_status = 'close'
		then 
			return -1;
	else 	
		update Customers
		set AccountStatus = 'close' 
		where CustomerID = CustomerID_;
		
		delete from AccountBalance
		where AccountNum = AccountNum_;
		
		delete from Savings
		where AccountNum = AccountNum_;
		
		delete from Top10Customers
		where AccountNum = AccountNum_;
		

		
		return AccountNum_;
		
	end if;
	
END;
$$ language plpgsql 

