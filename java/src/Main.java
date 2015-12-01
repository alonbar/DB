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
        double b = CheckMySavings.checkMySavings(4, Date.valueOf("2019-11-01"));
        System.out.println("result:" +  Double.toString(b));
        CheckMySavings.close();
    }
}