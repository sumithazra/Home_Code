
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML>
<HEAD>
<%@ page import='java.sql.*' %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="2000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>change_password_conn.jsp</TITLE>
</HEAD>
<BODY background="background.gif">

<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%

        Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");


     try
     {
     	HttpSession s=request.getSession(true);
		String session_account=(String)s.getAttribute("customer_no");
		int s_a=Integer.parseInt(session_account);
		//out.println(s_a);


		PreparedStatement stmt1=con.prepareStatement("select * from login_tab where acc_no="+s_a);
     	ResultSet rs1=stmt1.executeQuery();

		//String id1=request.getParameter("account_no");
		String old_pass1=request.getParameter("old_pass");
		String new_pass1=request.getParameter("new_pass");
		String confirm_pass1=request.getParameter("confirm_pass");

		int flag=0;
		while(rs1.next())
		{
			int id=Integer.parseInt(rs1.getString("acc_no"));
			String pass=rs1.getString("password");

			if((id==s_a)&&(pass.compareTo(old_pass1)==0))
			{
			     flag=1;
			}
	 	}
	 	if(flag==1)
	 	{
	 		//out.println("Valid User");
	 		if(new_pass1.compareTo(confirm_pass1)==0)
	 		{
	 			PreparedStatement stmt2=con.prepareStatement("update login_tab set password=? where acc_no="+s_a);
				stmt2.setString(1,new_pass1);
				stmt2.executeUpdate();
%>
				<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
				Your Password has been successfully changed.</FONT></P>
				<P align="center"><B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Continue</FONT></A>&gt;&gt;</B></p>
<%			}
			else
			{
%>
				<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
				Sorry your New and Confirmed Password do not match.</FONT></P>
				<P align="center"><B> &lt;&lt;<A href="change_password.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>
<%				//out.println("your new and confirmed password do not match");
			}
	  	}
	 	else
	 	{
%>
				<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
				Sorry your Old Password is Invalid.</FONT></P>
				<P align="center"><B> &lt;&lt;<A href="change_password.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>
<%	 		//out.println("Invalid User");
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


</BODY>
</HTML>
