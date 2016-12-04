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

<script type="text/javascript">

function emailFun()
{
if(document.forms[0].elements[0].value=="")
{
alert("You cann't leave it blank");
document.forms[0].elements[0].focus;
}
}


function ansFun()
{
if(document.forms[0].elements[1].value=="")
{
alert("You cann't leave it blank");
document.forms[0].elements[0].focus;
}
}

function subclick()
{

if(document.forms[0].elements[0].value=="" && document.forms[0].elements[0].value=="")
{
alert("You cann't leave input box blank");
document.forms[0].elements[0].focus;
}
return false;
}
</script>

</HEAD>

<BODY  background="Image/background.gif">

<jsp:include page="logo_page1.html" flush="true"/>

<form name="login_page"method="post" action="forgotpassword1.jsp">
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
					<TR>
						<TD align="center" width="312" height="60"><FONT size="4"
							face="Arial Baltic">Email Id:-</FONT></TD>
						<TD align="center" width="168" height="60">
						<INPUT type="text" name="email" size="19" maxlength="60" tabindex="1" onblur="emailFun()"></TD>
					</TR>
					<TR>
						<TD align="center" width="312" height="66"><FONT size="4"
							face="Arial Baltic">Hint Answer :</FONT></TD>
						<TD align="center" width="168" height="66"><INPUT type="text"
							name="ans" size="19" maxlength="50" tabindex="2" onblur="ansFun()"></TD>
					</TR>
					<TR>
						<TD align="center" width="312" height="59">
						<INPUT type="reset" name="reset" value="RESET" tabindex="3"></TD>
						<TD align="center" width="168" height="59">
						<INPUT type="submit" name="submit" value="SUBMIT" tabindex="3" onclick="subclick()"></TD>


					</TR>
					<tr name="msg"></tr>
				</TBODY>
			</TABLE>

		</TD>
	</TR>
</TBODY>
</table>
</form>
</BODY>
</HTML>
