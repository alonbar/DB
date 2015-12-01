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


        CheckMySavings.init("alonba");
        double b = CheckMySavings.checkMySavings(3, Date.valueOf("2011-12-01"));
        CheckMySavings.close();
    }
}