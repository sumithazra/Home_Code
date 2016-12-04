/**@author:sumit
 * @date:21-10-2013
 * @implementation_of_changer_equest:CR001
 * @description:It is servlet class for validate registration.
 *
 * */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import model.ConnectionClass;

public class LoginBothBL
{   /** validate method takes user id and password as a parameter and check the database whether the user is valid or not **/
	public ArrayList validate(String u_id,String pwd)
	{
		ArrayList arr=new ArrayList();
		Connection con=new ConnectionClass().connect();
		 try
	     {
	     	PreparedStatement stmt=con.prepareStatement("select * from login where user_id=? and password=?");
	     	stmt.setString(1,u_id);
	     	stmt.setString(2,pwd);
	     	ResultSet rs=stmt.executeQuery();
			//HttpSession s1=request.getSession(true);
		 	//s1.setAttribute("user_id",id1);
			if(rs.next())
			{
				String id=rs.getString("user_id");
				String pass=rs.getString("password");
				String roll=rs.getString("roll");

				if((id.compareTo(u_id)==0)&&(pass.compareTo(pwd)==0))
				{
					arr.add(true);
				     arr.add(id);
				     arr.add(roll);
				}
				else
				{
					arr.add(false);
					System.out.println("Invalid");
				}
		 	}
			else
			{
				arr.add(false);
				System.out.println("Invalid");
			}

	     }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }

		return arr;
	}
}
