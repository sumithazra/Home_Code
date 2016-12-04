<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page import="dao.CustomerService"%>
<%@page import="javax.swing.text.Document"%>
<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>Forget Password</TITLE>

</HEAD>

<BODY  background="Image/background.gif">

<jsp:include page="logo_page1.html" flush="true"/>

<form name="login_page"   method="get">
	<br>
	<TABLE border="0" bgcolor="blue">
			<TBODY>
					<TR>

						<TD align="center" width="1210"><marquee width="880"><FONT size="4" color="#ffffff"
							face="Arial"><B>Complete &nbsp;&nbsp;  Banking &nbsp;&nbsp; Solution</B></FONT></marquee></TD>
					</TR>
			</TBODY>
	</TABLE>
	<table>
    <TBODY>
            <TR>
     	       <TD  valign="top" align="center" height="351" width="485"><FONT
				size="5" color="#00ffff" face="Arial Black"><U></U></FONT><BR>
				<BR>

				<BR>
				<BR>
				<IMG border="0" src="Image/admin.JPG" width="157" height="146">
			  </TD>
              <TD height="351" width="289">
<TABLE width="298" border="3" cellpadding="0" cellspacing="0">
				<TBODY>
				<%
				CustomerService obj=new CustomerService();
//				System.out.print(request.getParameter("acc"));
				if(obj.forgetPassword(request.getParameter("email"),request.getParameter("ans")))
				{
					%>
					<tr>your reqest hasbeen submitted.</tr>
				<%}
				else
				{%>
				<tr>no records found  </tr>
				<% }%>


					</TR>
				</TBODY>
			</TABLE>

		</TD>
	</TR>
</TBODY>
</table>
</form>
</BODY>
</HTML>
