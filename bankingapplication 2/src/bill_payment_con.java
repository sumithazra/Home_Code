

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class bill_payment_con extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public bill_payment_con() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		PrintWriter out=null;
		 try
	     {
			 Class.forName("oracle.jdbc.OracleDriver");
		     con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");
		     out=response.getWriter();

			HttpSession s=request.getSession(true);
			String session_account=(String)s.getAttribute("customer_no");
			int s_a=Integer.parseInt(session_account);


	     	//int acc_no1=Integer.parseInt(request.getParameter("acc_no"));
			String bill_type1=request.getParameter("r1");
			//out.println(bill_type1);
	    	int bill_no1=Integer.parseInt(request.getParameter("bill_no"));
	   		double amount1=Double.parseDouble(request.getParameter("amount"));
			String date1=request.getParameter("date");

			PreparedStatement stmt1=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
	     	ResultSet rs1=stmt1.executeQuery();

			int flag=0;
			int flag1=0;

			while(rs1.next())
			{
				int account_number=Integer.parseInt(rs1.getString("cust_acc_no"));
				if(account_number==s_a)
				{
				     flag=1;
					     double bal=Double.parseDouble(rs1.getString("cust_balance"));
					 if(amount1>bal)
					 {
						 out.println("<P align=center><FONT size=5 color=#ff0000 face=Arial Black><BR> Not enough money in your Account.</FONT></P>");
						 out.println("<P align=center>&lt;&lt;<B> <A href=home_page.jsp><FONT size=5 color=#0000a0 face=Arial>Back</FONT></A></B></p>");
						 flag1=1;
					 }
					 else
					 {
						double update_bal=bal-amount1;
					 	PreparedStatement stmt2=con.prepareStatement("insert into bill_payment_tab(acc_no,bill_type,bill_no,bill_amount,bill_date) values(?,?,?,?,?)");
					 	stmt2.setInt(1,s_a);
						stmt2.setString(2,bill_type1);
						stmt2.setInt(3,bill_no1);
						stmt2.setDouble(4,amount1);

						String s1=date1.substring(0,2);
						String s2=date1.substring(3,5);
						String s3=date1.substring(6,10);
						String correct_date=s3+"-"+s2+"-"+s1;
						//out.println(correct_date);
						stmt2.setString(5,correct_date);


						stmt2.executeUpdate();

						PreparedStatement stmt3=con.prepareStatement("update cust_info_tab set cust_balance=? where cust_acc_no="+s_a);
						stmt3.setDouble(1,update_bal);
						stmt3.executeUpdate();

						PreparedStatement stmt4=con.prepareStatement("insert into balance_enq(acc_no,bal_date,bal_description,bal_amount) values(?,?,?,?)");
	     				stmt4.setInt(1,s_a);

						String str1=date1.substring(0,2);
						String str2=date1.substring(3,5);
						String str3=date1.substring(6,10);
						String correct_date1=str3+"-"+str2+"-"+str1;
						//out.println(correct_date1);
						stmt4.setString(2,correct_date1);

						stmt4.setString(3,bill_type1+" bill paid");
						stmt4.setDouble(4,amount1);
						stmt4.executeUpdate();

				}
				}
			}
		    if(flag1==1)
			{
			}
			if(flag==0)
			{

				out.println("<P align=center><FONT size=5 color=#ff0000 face=Arial Black><BR>				Sorry ! Not a valid Account Number</FONT></P>");
				out.println("<P align=center>&lt;&lt;<B> <A href=home_page.jsp><FONT size=5 color=#0000a0 face=Arial>Back</FONT></A></B></p>");


			}
			response.sendRedirect("inter.jsp");
		 }
		 catch (SQLException e)
		{
			out.println(e.getMessage());
			out.println(e.getErrorCode());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally
		{
			try{
			con.close();
			}catch(SQLException e){}
		}

	}

}
