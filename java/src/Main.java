import java.util.*;
public class Main {
    public static void main(String[] str) throws Exception {
//        Class.forName("org.postgresql.Driver");
//        Connection con =   	DriverManager.getConnection("jdbc:postgresql://dbcourse/public?user=alonba");
//        Statement stmt = con.createStatement();
//        ResultSet rs = stmt.executeQuery("select 'hello world'");
//        while(rs.next()) {
//            System.out.println(rs.getString(1));
//        }
//        stmt.close();  rs.close(); con.close();

        CheckMySavings mySavings = new CheckMySavings();

        mySavings.init("alonba");

        int accountNum = 1;

        Date openDate = new GregorianCalendar(2015, Calendar.DECEMBER, 1).getTime();

        double sumOfSavingPlans = mySavings.checkMySavings(accountNum, openDate);

        System.out.println("sum of saving plans is: " + sumOfSavingPlans);

        mySavings.close();
    }
}