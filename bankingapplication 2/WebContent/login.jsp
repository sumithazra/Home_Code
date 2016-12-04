<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>login.jsp</TITLE>
</HEAD>

<BODY  background="Image/background.gif">

<jsp:include page="logo_page1.html" flush="true"/>

<form name="login_page"  action="LoginBoth" method="get">
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
				size="5" color="#00ffff" face="Arial Black"><U>LOGIN</U></FONT><BR>
				<BR>
				<IMG border="0" src="Image/login3.JPG" width="302" height="93">
				<BR>
				<BR>
				<IMG border="0" src="Image/admin.JPG" width="157" height="146">
			  </TD>
              <TD height="351" width="289">
			  <TABLE width="298" border="3" cellpadding="0" cellspacing="0">
				<TBODY>
					<TR>
						<TD align="center" width="312" height="60"><FONT size="4"
							face="Arial Baltic">User Id :</FONT></TD>
						<TD align="center" width="168" height="60"><INPUT type="text"
							name="user_id" size="19" maxlength="10" tabindex="1"></TD>
					</TR>
					<TR>
						<TD align="center" width="312" height="66"><FONT size="4"
							face="Arial Baltic">Password :</FONT></TD>
						<TD align="center" width="168" height="66"><INPUT type="password"
							name="password" size="19" maxlength="10" tabindex="2"></TD>
					</TR>
					<TR>
						<TD align="center" width="312" height="59"><IMG border="0"
							src="Image/cash.jpg" width="120" height="91"></TD>
						<TD align="center" width="168" height="59">
						<INPUT type="submit" name="submit" value="SUBMIT" tabindex="3"></TD>

					</TR>
				<TR><td><a href="forgetpassword.jsp">Forget Password</a></td></TR>
				</TBODY>
			</TABLE>

		</TD>
	</TR>
</TBODY>
</table>
</form>
</BODY>
</HTML>
