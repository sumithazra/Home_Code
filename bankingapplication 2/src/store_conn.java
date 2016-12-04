

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class store_conn extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public store_conn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con =null;
		PrintWriter out=response.getWriter();
		out.println("<TITLE>UPDATIONS INTO TABLES</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY background=Image/background.gif>");
		RequestDispatcher rd = request.getRequestDispatcher("logo_page1.html");
		rd.include(request, response);

		try
		{
			 Class.forName("oracle.jdbc.OracleDriver");
		     con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

				int flag=0;
				HttpSession s1=request.getSession(true);
				String session_account1=s1.getAttribute("user_id").toString();

				int account_no1=Integer.parseInt(request.getParameter("account_no"));
				String pass_word=request.getParameter("pass_word");

				double balance1 =Double.parseDouble(request.getParameter("balance"));

		     	PreparedStatement stmt3=null;
		       	stmt3=con.prepareStatement("select * from temporary_tab");
		       	ResultSet rs3=null;
		       	rs3=stmt3.executeQuery();
					while(rs3.next())
					{
						int acc=Integer.parseInt(rs3.getString("acc_no"));

						if(account_no1==acc)
						{
							flag=1;
							break;
						}
					}

		     	if(flag==1)
		     	{
		       	PreparedStatement stmt1=null;
		       	stmt1=con.prepareStatement("select * from temporary_tab where acc_no="+account_no1);
		       	ResultSet rs1=null;
		       	rs1=stmt1.executeQuery();
		        rs1.next();
			    String acc_type1=rs1.getString("acc_type");
		        String fname1=rs1.getString("fname");
				String mname1=rs1.getString("mname");
		        String lname1=rs1.getString("lname");
		     	String dob1=rs1.getString("dob");
		     	String sex1=rs1.getString("sex");
				String marital_status1=rs1.getString("marital_status");
				String occupation1=rs1.getString("occupation");
				String address1=rs1.getString("address");
				String city1=rs1.getString("city");
				String state1=rs1.getString("state");
				String country1=rs1.getString("country");
				String zip1=rs1.getString("zip");
				String tel_landline1=rs1.getString("tel_land");
				String tel_mobile1=rs1.getString("tel_mob");
			    String email1=rs1.getString("email");


		       	PreparedStatement stmt2=con.prepareStatement("insert into cust_info_tab(cust_acc_no,cust_acc_type,fname,mname,lname,dob,sex,marital_status,occupation,address,city,state,country,zip,email,tel_landline,tel_mob,cust_balance) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		     		stmt2.setInt(1,account_no1);
		     		stmt2.setString(2,acc_type1);
		       		stmt2.setString(3,fname1);
		     		stmt2.setString(4,mname1);
		     		stmt2.setString(5,lname1);
		     		stmt2.setString(6,dob1);
		     		stmt2.setString(7,sex1);
		     		stmt2.setString(8,marital_status1);
		     		stmt2.setString(9,occupation1);
		     		stmt2.setString(10,address1);
					stmt2.setString(11,city1);
					stmt2.setString(12,state1);
					stmt2.setString(13,country1);
					stmt2.setString(14,zip1);
					stmt2.setString(15,email1);
					stmt2.setString(16,tel_landline1);
					stmt2.setString(17,tel_mobile1);
		     		stmt2.setDouble(18,balance1);
					stmt2.executeUpdate();

					PreparedStatement stmt5=con.prepareStatement("insert into login_tab(acc_no,password) values(?,?)");
					stmt5.setInt(1,account_no1);
		     		stmt5.setString(2,pass_word);
					stmt5.executeUpdate();

					out.println("<P align=center><FONT size=5 color=#ff0000 face=Arial Black><BR>Saved Successfully</FONT></P><P align=center><B> &lt;&lt;<A href=verify_new_user.jsp><FONT size=5 color=#0000a0 face=Arial>Back</FONT></A></B></p>");

					PreparedStatement stmt4=con.prepareStatement("delete from temporary_tab where acc_no="+account_no1);
		     		stmt4.executeUpdate();
		     		}
		     		else
		     		{
				     			out.println("<P align=center><FONT size=5 color=#ff0000 face=Arial Black><BR>Invalid Account Number.</FONT></P><P align=center><B> &lt;&lt;<A href=verify_new_user.jsp><FONT size=5 color=#0000a0 face=Arial>Back</FONT></A></B></p>");
		     		}
		}catch(SQLException e){
				System.out.println(e.getMessage());
				System.out.println(e.getErrorCode());
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally
		{
				try{
					con.close();
				}catch(Exception e){}
		}
		out.println("</BODY></HTML>");
	}

}
