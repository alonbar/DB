CREATE OR REPLACE FUNCTION tirggerCFuncActions() RETURNS TRIGGER AS $$ 
BEGIN
	NEW.ActionDate = CURRENT_DATE;
    return new;  
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER triggerCOnActions
BEFORE insert on Actions
FOR EACH ROW execute procedure tirggerCFuncActions();


CREATE OR REPLACE FUNCTION tirggerCFuncSavings() RETURNS TRIGGER AS $$ 
BEGIN
	NEW.DepositDate = CURRENT_DATE;
    return new;  
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER triggerCOnSavings
BEFORE insert on Savings
FOR EACH ROW execute procedure tirggerCFuncSavings();
