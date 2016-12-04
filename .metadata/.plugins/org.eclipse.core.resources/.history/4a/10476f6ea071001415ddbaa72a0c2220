import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionTest {

	public static void main(String[] args) {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			System.out.println("Driver calss loading successfull");
			
			
		} catch (Exception e) {
			
			
			System.out.println("Driver class is not loaded");
			
			
		}
		
		Connection con = null;

		try {

			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

		} catch (SQLException ep) {
			
			ep.printStackTrace();
		}
		
		if(con!=null)
		{
			System.out.println("connection");
		}
		
		
		
	}
	
}
