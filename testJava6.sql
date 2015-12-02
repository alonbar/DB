-- case: no customers (return -1 in checkMySavings without exception or System.out.println(error_msg))

\i createTables.sql;

\i helperFunctions.sql;

\i newCustomer.sql;

\i closeCustomer.sql;

\i doAction.sql;

\i newSaving.sql;


/* in Java:
public static void main(String[] args)
    {
        // TODO Auto-generated method stub

        CheckMySavings mySavings = new CheckMySavings();

        mySavings.init("liormor");

        int accountNum = 1;

        Date openDate = new GregorianCalendar(2015, Calendar.DECEMBER, 11).getTime();

        double sumOfSavingPlans = mySavings.checkMySavings(accountNum, openDate);

        System.out.println("sum of saving plans is: " + sumOfSavingPlans);

        mySavings.close();
    }
*/ 

/* return:
sum of saving plans is: -1
*/


 -- drop tables
--\i drop.sql;









