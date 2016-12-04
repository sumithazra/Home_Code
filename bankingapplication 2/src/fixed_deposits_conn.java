

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class fixed_deposits_conn extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public fixed_deposits_conn() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		out.println("<BODY background=Image/background.gif>");
		RequestDispatcher rd = request.getRequestDispatcher("logo_page1.html");
		rd.include(request, response);
		//out.println("<table align='center' width='100%'>");
		//out.println("<tr width='100%'><td><img  src='Image\\lo1.bmp'></table>");
		try{
			 Class.forName("oracle.jdbc.OracleDriver");
		     Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

	     	HttpSession s=request.getSession(true);
			String session_account=s.getAttribute("customer_no").toString();
			int s_a=Integer.parseInt(session_account);

	     	int period1=Integer.parseInt(request.getParameter("period"));
	   		int amount1=Integer.parseInt(request.getParameter("amount"));
			//int date1=Integer.parseInt(request.getParameter("date"));
	    	String d=request.getParameter("date");


			PreparedStatement stmt1=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
	     	ResultSet rs1=stmt1.executeQuery();

			int flag=0;
			int flag1=0;
			while(rs1.next())
			{
				int account_number=Integer.parseInt(rs1.getString("cust_acc_no"));
				//out.println(account_number);


				if(account_number==s_a)
				{
				     flag1=1;
	               double bal=Double.parseDouble(rs1.getString("cust_balance"));
				   // out.println(bal);

					 if((amount1+1000)>bal)
					 {
					 	//out.println("xyz");


						 out.println("<P align=center><FONT size=5 color=#ff0000 face=Arial Black><BR>Not enough money in your Account.</FONT></P>");
						 out.println("<P align=center>&lt;&lt;<B> <A href=home_page.jsp><FONT size=5 color=#0000a0 face=Arial>Back</FONT></A></B></p>");


					 	//System.out.println("Not enough money in your account");
					 	flag=1;
					 }
					 else
					 {
					 	double update_bal=bal-amount1;
					 	//out.println(update_bal);

						PreparedStatement stmt2=con.prepareStatement("insert into deposit_tab(account_no,dep_type,dep_amount,dep_period,dep_date) values(?,?,?,?,?)");
	     				stmt2.setInt(1,s_a);
						stmt2.setString(2,"Fixed");
						stmt2.setInt(3,amount1);
						stmt2.setDouble(4,period1);
						/*
						java.util.Date today= new java.util.Date();
						int s1= today.getYear();
						int s2= today.getMonth();
						int s3= today.getDay();
						String correct_date=(s1)+"-"+(s2)+"-"+(s3);
						System.out.println(new java.util.Date());
						stmt2.setString(5,correct_date); //////************************edited replaced date1 with 2007-11-28
						*/
						String s1=d.substring(0,2);
						String s2=d.substring(3,5);
						String s3=d.substring(6,10);
						String correct_date=s3+"-"+s2+"-"+s1;
						//out.println(correct_date);
						stmt2.setString(5,correct_date);
						stmt2.executeUpdate();

						PreparedStatement stmt3=con.prepareStatement("update cust_info_tab set cust_balance=? where cust_acc_no="+s_a);
						stmt3.setDouble(1,update_bal);
						stmt3.executeUpdate();

						out.println("<P align=center><FONT size=5 color=#ff0000 face=Arial Black><BR>The Amount has been successfully deposited in the Fixed Account.</FONT></P>");
						out.println("<P align=center><B><A href=home_page.jsp><FONT size=5 color=#0000a0 face=Arial>Continue</FONT></A>&gt;&gt;</B></p>");
				}
					if(flag==1)
					{
						//out.println("xyz");
					}

				}
				else if(flag1==0)
				{
					out.println(account_number);
					out.println("Not a Valid Account Number");
				}
			}
		 }
		 catch (SQLException e)
		{
			out.println(e.getMessage());
			out.println(e.getErrorCode());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
