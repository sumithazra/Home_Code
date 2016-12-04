package dao;

import java.sql.*;

import connect.ConnectionPro;

public class UVarification {
	 
		public boolean getvarified(String id, String password) {

			String UserID = id;
			String Password = password;
			ConnectionPro con = new ConnectionPro();
			Connection conn = con.getConnection();
			ResultSet rs = null;
			boolean flag = false;
			try {
				PreparedStatement pst = conn
						.prepareStatement("select  * from LOGIN where id=? and pwd=? ");
				pst.setString(1, UserID);
				pst.setString(2, Password);
				rs = pst.executeQuery();
				if (rs.next()) {
					System.out.println(rs.getString(1));
					System.out.println(rs.getString(2));
					flag = true;
				}

			} catch (Exception ep) {
				ep.printStackTrace();
			}

		//	System.out.println(flag);
			return flag;
		}
}
