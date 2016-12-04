package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.ConnectionClass;

public class NewAccountBL
{   /**Connection class reference variable **/
	Connection con;

	/**PreparedStatement class reference variable **/
	PreparedStatement stmt2;
	int response;
	public int insert(NewAccountBean o)
	{
		ConnectionClass co=new ConnectionClass();
		con=co.connect();
		try
		{
		stmt2=con.prepareStatement("insert into temporary_tab(acc_no,acc_type,fname,mname,lname,dob,sex,marital_status,occupation,address,city,state,country,zip,tel_land,tel_mob,email) values(seq1.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
 		stmt2.setString(1,o.getAcc_type2());
 		stmt2.setString(2,o.getFname2());
 		stmt2.setString(3,o.getMname2());
 		stmt2.setString(4,o.getLname2());
 		stmt2.setString(5,o.getDob());
 		stmt2.setString(6,o.getSex2());
 		stmt2.setString(7,o.getMarital_stat2());
 		stmt2.setString(8,o.getOcc());
 		stmt2.setString(9,o.getAddress2());
		stmt2.setString(10,o.getCity2());
		stmt2.setString(11,o.getState2());
		stmt2.setString(12,o.getCountry2());
		stmt2.setInt(13,o.getZipcode2());
		stmt2.setString(14,o.getLandline2());
		stmt2.setString(15,o.getMobile2());
		stmt2.setString(16,o.getEmail2());
		response=stmt2.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
			stmt2.close();
			con.close();
			}catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
		return response;
	}
}
