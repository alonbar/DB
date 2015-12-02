DROP TRIGGER TRIGGERA on ACCOUNTBALANCE;
DROP TRIGGER TRIGGERB on ACCOUNTBALANCE;
DROP TRIGGER triggerCOnActions on Actions;
DROP TRIGGER triggerCOnSavings on Savings;
DROP TRIGGER triggerD on AccountBalance;



drop function closeCustomer(CustomerID_ INTEGER);
drop function newCustomer(CustomerID_ INTEGER,CustomerName_ VARCHAR, CustomerPassword_ VARCHAR, Overdraft_ REAL);
drop function newSaving(CustomerID_ INTEGER, Deposit_ REAL, DepositDate_ DATE, NumOfYears_ INTEGER, Interest_ REAL);
drop function doAction(CustomerID_ INTEGER, ActionName_ VARCHAR, ActionDate_ DATE, Amount_ REAL);
