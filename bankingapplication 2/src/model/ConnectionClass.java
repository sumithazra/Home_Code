/*@author:sumit
 * @date:21-10-2013
 * @implementation_of_changer_request:CR001
 * @description:This servlet class is used to register the database driver and to create connection with database.
 *
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass
{   /** Connection class reference variable*/
	Connection con;
	/** connect() method is responsible for register database driver and make connection with database driver and return connection class object **/
	public Connection connect()
	{
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
	        con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");
		}
		catch(ClassNotFoundException ex)
		{
			ex.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
