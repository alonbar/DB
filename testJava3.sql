\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

-- a) simple case: adds new Customers

select newCustomer(1, 'a', 'aPassword', -400); -- return 1

select newCustomer(2, 'b', 'bPassword', -400); -- return 2

\i closeCustomer.sql;

\i doAction.sql;

\i newSaving.sql;

select doAction(1, 'receive', '2014-01-01', 100); -- return 1

select newSaving(1, 40, '2014-01-01', 3, 1); -- return 1

/* in Java:
public static void main(String[] args)
    {
        // TODO Auto-generated method stub

        CheckMySavings mySavings = new CheckMySavings();

        mySavings.init("liormor");

        int accountNum = 1;
        
        Date openDate = new GregorianCalendar(2015, Calendar.DECEMBER, 1).getTime();

        double sumOfSavingPlans = mySavings.checkMySavings(accountNum, openDate);

        System.out.println("sum of saving plans is: " + sumOfSavingPlans);

        mySavings.close();
    }
*/ 

/* return:
sum of saving plans is: 80
*/


 -- drop tables after all run ok
--\i drop.sql;









