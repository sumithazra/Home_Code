package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connect.ConnectionPro;

public class Test {
	public boolean getvarified(String id, String password) {
		ConnectionPro conpro = new ConnectionPro();

		Connection conn = conpro.getConnection();

		System.out.println(conn.getClass());

		ResultSet rs = null;
		boolean flag = false;

		String UserID = id;

		String Password = password;
		try {
			PreparedStatement pst = conn
					.prepareStatement("select  * from LOGIN where id=? and pwd=? ");
			pst.setString(1, UserID);
			pst.setString(2, Password);
			rs = pst.executeQuery();

			if (rs.next()) {

				System.out.println(rs.getString(1));

				flag = true;

			}

		} catch (Exception ep) {
			ep.printStackTrace();
		}

		// System.out.println(flag);
		return flag;

	}
}
