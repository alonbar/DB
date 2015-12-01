/**
 * Created by alonba on 12/1/15.
 */
import java.sql.*;
import java.util.Calendar;
import java.util.Date;

public class CheckMySavings
{
    public static Connection con;
    private static String CONNECTION_STRING_PREFEX = "jdbc:postgresql://dbcourse/public?user=";

    public static void init(String userName) throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            String connectionString = CONNECTION_STRING_PREFEX.concat(userName);
            con = DriverManager.getConnection(connectionString);
        }
        catch (Exception e)
        {
            System.out.println("There was a problem with connecting to the DB");
            System.exit(-1);
        }

    }

    public static void close()
    {
        try {
            con.close();
        } catch (Exception name) {
            System.out.println("There was a problem with closing connection");
            System.exit(-1);
        }

    }

    public static double calculateSignleDeposit(Date openDate, double deposit, Date depositDate, int numOfYears, float interest) {

        depositDate.setYear(depositDate.getYear() + numOfYears);
        Date candidateDate = new Date(depositDate.getTime());
        if (openDate.compareTo(depositDate) == -1) {
            depositDate.setYear(depositDate.getYear() - numOfYears);
            return deposit * (openDate.getYear() - depositDate.getYear() + 1);
        }
        else {
            return calculateSignleDeposit(deposit, numOfYears, interest);
        }
    }

    public static double calculateSignleDeposit(double deposit, int numOfYears, float interest) {
        if (numOfYears == 1)
        {

            return deposit * (1 + interest);
        }
        else {
            return (deposit + calculateSignleDeposit(deposit, numOfYears - 1, interest)) * (1 + interest);
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
            if (!rs.isBeforeFirst() ) {
                return -1;
            }
//            rs.beforeFirst();
            Double aggregatedSavings = 0D;
            while (rs.next()) {
                Date currentDepositDate = rs.getDate("depositdate");
                int currentNumOfYears = rs.getInt("numOfYears");
                float currentInterest = rs.getFloat("interest");
                double currentDeposit = rs.getDouble("deposit");
                aggregatedSavings = aggregatedSavings + calculateSignleDeposit(openDate, currentDeposit, currentDepositDate, currentNumOfYears, currentInterest);
            }
            pstmt.close();
            rs.close();
            return aggregatedSavings;
        } catch (SQLException e) {
            while (e != null) {
                System.out.println(e.getSQLState());
                System.out.println(e.getMessage());
                System.out.println(e.getErrorCode());
                e = e.getNextException();
            }
            return -1;
        }


    }

}
