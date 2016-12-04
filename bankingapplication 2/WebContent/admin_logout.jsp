<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html;

charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere

Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>admin_logout.jsp</TITLE>
</HEAD>
<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<P><BR>
<BR>
</P>

<%
		HttpSession s1=request.getSession(true);
		String session_account1=(String)s1.getAttribute("user_id");
		s1.invalidate();

%>

<P align="center"><FONT size="5" color="#ff0000" face="Arial

Black">Thank you.<br>Your have
successfully Logged Out.</FONT><BR>
<a href="login.jsp"><B>HOME</B></a>
<BR>
<BR>
</BODY>
</HTML>
