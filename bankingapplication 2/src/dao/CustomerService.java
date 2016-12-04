/**@author:sumit
 * @date:21-10-2013
 * @implementation_of_changer_equest:CR001
 * @description:It is servlet class, responsible for insert the into the temp customer info table.
 *
 * */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.ConnectionClass;

public class CustomerService
{   /**Connection class reference Variable to establish database connectivity **/
	Connection con;
	/**PreparedStatement class reference Variable to execute SQL query.**/
	PreparedStatement stmt;
	/**ResultSet class reference variable **/
	ResultSet rs;
	String name1="";
	int response;
	ConnectionClass co=new ConnectionClass();

	public String custNameDisplay(int s_a)
	{
		try
		{
			/** connect() method in ConnectionClass.java.
			 * returns connection class object
			 */

			con=co.connect();
			stmt=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
			rs=stmt.executeQuery();
			rs.next();
 	   		name1=rs.getString(3);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {
				stmt.close();
				rs.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return name1;
	}

/** insert method is used to insert a new customer information into temporary table **/
	public int insert(NewAccountBean o)
	{
		con=co.connect();
		try
		{
		stmt=con.prepareStatement("insert into temporary_tab(acc_no,acc_type,fname,mname,lname,dob,sex,marital_status,occupation,address,city,state,country,zip,tel_land,tel_mob,email,answer) values(seq1.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
 		stmt.setString(1,o.getAcc_type2());
 		stmt.setString(2,o.getFname2());
 		stmt.setString(3,o.getMname2());
 		stmt.setString(4,o.getLname2());
 		stmt.setString(5,o.getDob());
 		stmt.setString(6,o.getSex2());
 		stmt.setString(7,o.getMarital_stat2());
 		stmt.setString(8,o.getOcc());
 		stmt.setString(9,o.getAddress2());
		stmt.setString(10,o.getCity2());
		stmt.setString(11,o.getState2());
		stmt.setString(12,o.getCountry2());
		stmt.setInt(13,o.getZipcode2());
		stmt.setString(14,o.getLandline2());
		stmt.setString(15,o.getMobile2());
		stmt.setString(16,o.getEmail2());
		stmt.setString(17,o.getAns());
		response=stmt.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
			stmt.close();
			con.close();
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
		return response;
	}


	public ArrayList viewDetails(int s_a)
	{
		ArrayList arr=new ArrayList();
		try
		{
		stmt=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
     	rs=stmt.executeQuery();
		rs.next();
		arr.add(rs.getString(2));
		arr.add(rs.getDouble(18));
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
			stmt.close();
			con.close();
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
		return null;
	}

	public boolean forgetPassword(String email,String ans)
	{
		boolean bol=false;
		try
		{
		con=co.connect();
		stmt=con.prepareStatement("select * from cust_info_tab where email=? and answer=?");
		stmt.setString(1, email);
		stmt.setString(2,ans);
		rs=stmt.executeQuery();
		if(rs.next())
		{
			bol=true;
			System.out.print(bol);
			System.out.print(rs.getString(4));
		}
		else
		{
			bol=false;
			System.out.print(bol);
			System.out.print(rs.getString(4));
		}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
			stmt.close();
			con.close();
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
		return bol;
	}



	public ArrayList fetchLocation()
	{
		ArrayList arr=new ArrayList();
		try
		{
			con=co.connect();
			stmt=con.prepareStatement("select disticnt state from cust_info_tab");
			rs=stmt.executeQuery();
			while(rs.next())
			{
				arr.add(rs.getString(1));
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		finally
		{
			try
			{
			stmt.close();
			con.close();
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}

		return arr;
	}

}
