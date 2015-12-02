import java.sql.*;
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

        float aaa = 28.28f;
        Double d = new Double(aaa);
        double p = d.doubleValue();
        double f = (double)aaa;
        CheckMySavings.init("alonba");
        double b = CheckMySavings.checkMySavings(14, Date.valueOf("2018-11-01"));
        System.out.println("result:" +  Double.toString(b));


        CheckMySavings.close();
    }
}