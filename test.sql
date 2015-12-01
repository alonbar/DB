Create or replace function 
    test(var integer)
    returns integer as $$
BEGIN
	return var;

	
END;
$$ language plpgsql
