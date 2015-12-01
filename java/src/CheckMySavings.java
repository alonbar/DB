/**
 * Created by alonba on 12/1/15.
 */
import java.sql.*;

public class CheckMySavings
{
    public static Connection con;
    private static String CONNECTION_STRING_PREFEX = "jdbc:postgresql://dbcourse/public?user=";
    public static void init(String userName) throws Exception {
        Class.forName("org.postgresql.Driver");
        String connectionString = CONNECTION_STRING_PREFEX.concat(userName);
        System.out.println(connectionString);
     	con = DriverManager.getConnection(connectionString);
    }

    public static void close()
    {
        try {
            con.close();
        } catch (Exception name) {
            System.exit(-1);
        }

    }


    public static double checkMySavings(int AccountNum, Date openDate)
    {

        String getAccountSavings = "Select * from Savings where AccountNum = ?";
        PreparedStatement pstmt;
        try {
            pstmt = con.prepareStatement(getAccountSavings);
            pstmt.setInt(1, AccountNum);
            ResultSet rs = pstmt.executeQuery();

        } catch (Exception name) {
            return -1;
        }

        return 0;
    }

}
