package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionPro {
	public Connection getConnection() {
		 
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException ep) {
			System.out.println("Where is your Driver Class");
			ep.printStackTrace();
           
		}

		Connection con = null;

		try {

			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");

		} catch (SQLException ep) {
			
			ep.printStackTrace();
		}
		
		if(con!=null)
		{
			System.out.println("cvonnection");
		}
		
		return con;
	}

	public void connectionClose(Connection con) {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException ep) {

			ep.printStackTrace();
		}
	}
}
