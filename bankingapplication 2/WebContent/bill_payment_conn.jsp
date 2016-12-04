
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML>
<HEAD>

<%@ page import='java.sql.*' %>
<%@ page import='javax.servlet.http.*' %>


<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="2000">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">
<TITLE>bill_payment_conn.jsp</TITLE>
</HEAD>
<BODY background="Image/background.gif">
<div align="center">
<%--<jsp:include page="logo_page1.html" flush="true"/>--%>
</div>

<%

     Class.forName("oracle.jdbc.OracleDriver");
     Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","bank","bank");


     try
     {

		HttpSession s=request.getSession(true);
		String session_account=s.getAttribute("customer_no").toString();
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
			     //out.println("Valid User");
			     double bal=Double.parseDouble(rs1.getString("cust_balance"));
				 if(amount1>bal)
				 {
%>
			<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
			Not enough money in your Account.</FONT></P>
			<p align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>

<%				 	//out.println("Not enough money in your account");
				 	flag1=1;
				 }
				 else
				 {
					double update_bal=bal-amount1;
				 	//out.println(update_bal);

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
%>
			<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
			Sorry ! Not a valid Account Number</FONT></P>
			<p align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>

<%			//out.println("Not a valid user");
		}
		response.sendRedirect("inter.jsp");
	 }
	 catch (SQLException e)
	{
		out.println(e.getMessage());
		out.println(e.getErrorCode());
		e.printStackTrace();
	}
	finally{
		con.close();
	}
%>
<p align="center"><IMG border="0" src="Image\rupee.jpg" width="252" height="169"></p>
</BODY>
</HTML>