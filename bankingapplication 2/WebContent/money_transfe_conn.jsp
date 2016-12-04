<%--@page import="model.connDB"--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<TITLE>Money Transfer</TITLE>
</HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

     try
     {
     	HttpSession s=request.getSession(true);
		String session_account=s.getAttribute("customer_no").toString();
		int s_a=Integer.parseInt(session_account);
		//out.println(s_a);

		//int sender_acc_no1=Integer.parseInt(request.getParameter("acc_no"));
     	double amount1=Double.parseDouble(request.getParameter("amount"));
     	int rec_acc_no1=Integer.parseInt(request.getParameter("rec_acc_no"));
		String date1=request.getParameter("date");

     	PreparedStatement stmt1=con.prepareStatement("select * from cust_info_tab");
     	ResultSet rs1=stmt1.executeQuery();
		int flag=0;
		int flag1=0;
		int flag2=0;

		while(rs1.next())
		{
			int sender_account_number=Integer.parseInt(rs1.getString("cust_acc_no"));

			if(sender_account_number==s_a)
			{
				flag=1;
			     //out.println("flag value ="+flag);
				double sender_balance=Double.parseDouble(rs1.getString("cust_balance"));
				//out.println("sender balanace "+sender_balance);
				PreparedStatement stmt2=con.prepareStatement("select * from cust_info_tab");
                                ResultSet rs2=stmt2.executeQuery();
                                if(amount1>sender_balance)
                                {
%>
					<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
					Not enough Money in your Account.</FONT></P>
					<p align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>

<%					//System.out.println("Not enough money in your account");
				}
				else
				{
					while(rs2.next())
					{
						int rec_account_number=Integer.parseInt(rs2.getString("cust_acc_no"));

						if(s_a==rec_acc_no1)
						{
							out.println("The Sender and Receiver Account Number is the same. Sorry cannot transfer.");
							flag2=1;
                                                        break;
						}
						else if(rec_account_number==rec_acc_no1)
						{
							flag1=1;
							//out.println("xyz");

							double receiver_balance=Double.parseDouble(rs2.getString("cust_balance"));
							//out.println(receiver_balance);
							PreparedStatement stmt3=con.prepareStatement("insert into money_transfer_tab(senders_acc_no,amount,receivers_acc_no,transfer_date) values(?,?,?,?)");
							stmt3.setInt(1,s_a);
							stmt3.setDouble(2,amount1);
							stmt3.setInt(3,rec_acc_no1);

							String s1=date1.substring(0,2);
							String s2=date1.substring(3,5);
							String s3=date1.substring(6,10);
							String correct_date=s3+"-"+s2+"-"+s1;
							//out.println(correct_date);
							stmt3.setString(4,correct_date);

							stmt3.executeUpdate();

							double update_receiver_bal=receiver_balance+amount1;

							double update_sender_bal=sender_balance-amount1;

							PreparedStatement stmt4=con.prepareStatement("update cust_info_tab set cust_balance=? where cust_acc_no="+s_a);
							stmt4.setDouble(1,update_sender_bal);
							stmt4.executeUpdate();

							PreparedStatement stmt5=con.prepareStatement("update cust_info_tab set cust_balance=? where cust_acc_no="+rec_acc_no1);
							stmt5.setDouble(1,update_receiver_bal);
							stmt5.executeUpdate();

							PreparedStatement stmt6=con.prepareStatement("insert into balance_enq(acc_no,bal_date,bal_description,bal_amount) values(?,?,?,?)");
							stmt6.setInt(1,s_a);
							//stmt6.setString(2,date1);
							String s21=date1.substring(0,2);
							String s22=date1.substring(3,5);
							String s23=date1.substring(6,10);
							String correct_date2=s23+"-"+s22+"-"+s21;
							//out.println(correct_date2);
							stmt6.setString(2,correct_date2);


							stmt6.setString(3,"Money Transfered");
							stmt6.setDouble(4,amount1);
							stmt6.executeUpdate();

							PreparedStatement stmt7=con.prepareStatement("insert into balance_enq(acc_no,bal_date,bal_description,bal_amount) values(?,?,?,?)");
							stmt7.setInt(1,rec_acc_no1);
							//stmt7.setString(2,date1);
							String str1=date1.substring(0,2);
							String str2=date1.substring(3,5);
							String str3=date1.substring(6,10);
							String correct_date1=str3+"-"+str2+"-"+str1;
							//out.println(correct_date);
							stmt7.setString(2,correct_date);

							stmt7.setString(3,"Money Received");
							stmt7.setDouble(4,amount1);
							stmt7.executeUpdate();
	%>
							<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
							Congratulations! Your Money has been transfered</FONT></P>
							<p align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>
	<%
						}
					}
					if(flag1==0)
					{
	%>
				<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
				Sorry ! Receiver's Account Number is not valid</FONT></P>
				<p align="center">&lt;&lt;<B> <A href="money_transfer2.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>
	<%

				//out.println("Receiver's Account Number is Not Valid User");
					}
				}
			}
		}
		if(flag2==0)
		{
		}

	}
	catch (SQLException e)
	{
	out.println(e.getMessage());
		out.println(e.getErrorCode());
		e.printStackTrace();
	}

%>

</BODY>
</HTML>
