create or replace function 
    newSaving(CustomerID_ INTEGER, Deposit_ REAL, DepositDate_ DATE, NumOfYears_ INTEGER, Interest_ REAL)
    returns integer as $$
DECLARE
	id_var integer;
	AccountNum_ integer;
	customer_status varchar;
	SavingNum_ INTEGER;
BEGIN

	select CustomerID, accountstatus, AccountNum into id_var, customer_status, AccountNum_
	from Customers 
	where CustomerID = CustomerID_;
	
	if NOT FOUND or customer_status = 'close'
		then 
			return -1;
	else 
		insert into Savings (AccountNum, 
							 Deposit, 
							 DepositDate,
							 NumOfYears, 
							 Interest)
					values (AccountNum_, 
							Deposit_,
							DepositDate_,
							NumOfYears_,
							Interest_) returning SavingNum into SavingNum_;
		PERFORM doAction(CustomerID_ , 'saving', DepositDate_, -Deposit_);
		
		return SavingNum_;		
	end if;
	
END;
$$ language plpgsql 

