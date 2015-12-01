create or replace function 
    newCustomer(CustomerID_ INTEGER,CustomerName_ VARCHAR, CustomerPassword_ VARCHAR, Overdraft_ REAL)
    returns integer as $$
DECLARE
	id_var integer;
	new_AccountNum integer;
	customer_status varchar;
BEGIN

	select CustomerID, accountstatus into id_var, customer_status
	from Customers 
	where CustomerID = CustomerID_;
	if NOT FOUND
		then 
			insert into Customers (CustomerID, CustomerName, CustomerPassword, AccountStatus , Overdraft) values (CustomerID_, CustomerName_, CustomerPassword_, 'open', Overdraft_);
			select AccountNum into new_AccountNum  from Customers where CustomerID = CustomerID_;
			insert into AccountBalance (AccountNum,	Balance) values  (new_AccountNum, 0); 
			return new_AccountNum;
	elsif customer_status = 'close'
		then 
			update Customers
			set CustomerName = CustomerName_, 
				CustomerPassword = CustomerPassword_, 
				AccountStatus = 'open' , 
				Overdraft = Overdraft_
			where CustomerID = CustomerID_;
			select AccountNum into new_AccountNum  from Customers where CustomerID = CustomerID_;
			insert into AccountBalance (AccountNum,	Balance) values  (new_AccountNum, 0); 
			return new_AccountNum;
	else 
		return -1;
	end if;
	
END;
$$ language plpgsql 

