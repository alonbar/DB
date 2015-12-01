drop function closeCustomer(CustomerID_ INTEGER);
drop function newCustomer(CustomerID_ INTEGER,CustomerName_ VARCHAR, CustomerPassword_ VARCHAR, Overdraft_ REAL);
drop function newSaving(CustomerID_ INTEGER, Deposit_ REAL, DepositDate_ DATE, NumOfYears_ INTEGER, Interest_ REAL);
drop function doAction(CustomerID_ INTEGER, ActionName_ VARCHAR, ActionDate_ DATE, Amount_ REAL);
