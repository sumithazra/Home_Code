<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="20000">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">

<TITLE>about_us.jsp</TITLE>
</HEAD>
<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<P><BR>
<BR>
</P>

<%
	try{
     	HttpSession s=request.getSession(true);
		String session_account=s.getAttribute("customer_no").toString();
		//int s_a=Integer.parseInt(session_account);
		s.invalidate();
	}catch(Exception e)
	{
		out.println("Error :"+e.getMessage());
	}
%>

<P align="center"><FONT size="5" color="#ff0000" face="Arial Black">Thank you.<br>You have
successfully Logged Out.</FONT><BR>
<BR>
<BR>
<a href ="login.jsp"><B> HOME</B> </a>
</BODY>
</HTML>