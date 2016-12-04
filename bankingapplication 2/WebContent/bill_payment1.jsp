<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="2000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>bill_payment1.jsp</TITLE>
</HEAD>

<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%HttpSession s=request.getSession(true);
String session_account=s.getAttribute("customer_no").toString();
int s_a=Integer.parseInt(session_account);
%>
<TABLE>
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center">
            	<jsp:include page="menu_page.html" flush="true"/></TD>
			<TD align="center" width="1093">
			<form name="bill_payment1" method="POST"><IMG border="0"
				src="Image\bill.gif" width="39" height="34"><FONT size="5"
				color="#0000a0" face="Arial Black"><U>BILL PAYMENT</U></FONT>
			<BR>
			<BR>
			<DIV align="right"><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]<BR>
			<br></FONT></a></DIV>
			<div align="left"><IMG border="0" src="Image\online1.jpg" width="239"
				height="279" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;<FONT
				face="Bookman Old Style" size="5"><B>Say </B></FONT><FONT
				face="Bookman Old Style" size="5" color="#ff0000"><B>Goodbye</B></FONT><FONT
				face="Bookman Old Style" size="5"><B> to standing in line or issuing cheques to
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pay
			your monthly Bills.</B><BR>
			</FONT><BR><FONT size="5" color="#000000"
				face="Bookman Old Style"><B>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With </B></FONT><FONT size="5"
				color="#ff0000" face="Bookman Old Style"><B>PSSR Bank Bill Payment
			Service</B></FONT><FONT
				size="5" color="#000000" face="Bookman Old Style"><B> you can now &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pay the following Bills :<BR>
			<BR>
			</B></FONT><FONT
				size="4" color="#ff0000" face="Bookman Old Style"><B>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Electricity<BR>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Water<BR>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Telephone<BR>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Mobile<BR>
			</B></FONT><BR>
			<BR>
			</div>
			<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
			<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    			<td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B>HOME</B></font></a></td>
    			<td><a href="bill_payment2.jsp" ><font face="Arial" size="2" color="white"><B> NEXT </B></font></a> </td>

    		</tr>
			</table>
			</form>
		</TR>
	</TBODY>
</TABLE>

</BODY>
</HTML>
