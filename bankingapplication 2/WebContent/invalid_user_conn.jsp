<%--@page import="model.connDB"--%>
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
<TITLE>invalid_user_conn.jsp</TITLE>
</HEAD>
<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

    try
	{
		int flag=0;
		HttpSession s1=request.getSession(true);
		String session_account1=(String)s1.getAttribute("user_id");

		int account_no2=Integer.parseInt(request.getParameter("account_no1"));
		//out.println(account_no2);

		PreparedStatement stmt4=con.prepareStatement("delete from temporary_tab where acc_no="+account_no2);
     	stmt4.executeUpdate();
%>
			<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
			Invalid User Request has been deleted.</FONT></P>
			<P align="center"><B> &lt;&lt;<A href="verify_new_user.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>
<%    }
    catch(Exception e)
	{
 	 out.println("error"+e);
	}


%>

</BODY>
</HTML>
