
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
<meta http-equiv="refresh"  content="20000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>fixed_deposits_conn.jsp</TITLE>
</HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>

<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","iprimed@123");

     try
     {
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

%>
<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
					Not enough money in your Account.</FONT></P>
					<P align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>


<%				 	//System.out.println("Not enough money in your account");
				 	flag=1;
				 }
				 else
				 {
				 	double update_bal=bal-amount1;
				 	//out.println(update_bal);

					PreparedStatement stmt2=con.prepareStatement("insert into deposit_tab(acc_no,dep_type,dep_amount,dep_period,dep_date) values(?,?,?,?,?)");
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
%>
					<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
					The Amount has been successfully deposited in the Fixed Account.</FONT></P>
					<P align="center"><B><A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Continue</FONT></A>&gt;&gt;</B></p>



<%				}
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
	}
	finally{
		con.close();
	}
%>
<P align="center"><IMG border="0" src="Image\fixed.JPG" width="321" height="177"></P>


</BODY>
</HTML>
