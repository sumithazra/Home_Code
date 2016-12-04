<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>bill_payment.jsp</TITLE>
</HEAD>
<BODY>
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%HttpSession s=request.getSession(true);
String session_account=(String)s.getAttribute("customer_no");
int s_a=Integer.parseInt(session_account);
%>
<TABLE>
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center"><jsp:include page="menu_page.html" flush="true"/></TD>
			<TD align="center" width="1093">
			<form name="bill_payment1" method="POST"><FONT size="5"
				color="#0000a0" face="Arial Black"><U>BILL PAYMENT</U></FONT>
			<BR>
			<BR>
			<DIV align="right"><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]<BR>
			<br></FONT></a></DIV>
			<div align="left"><IMG border="0" src="worlds.jpg" width="192"
				height="184" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
			&nbsp;&nbsp;<FONT
				face="Bookman Old Style" size="5"><B>Say </B></FONT><FONT
				face="Bookman Old Style" size="5" color="#ff0000"><B>Goodbye</B></FONT><FONT
				face="Bookman Old Style" size="5"><B> to standing in line or issuing cheques to pay your monthly Bills.
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</B><BR>
			</FONT><BR><FONT size="5" color="#000000"
				face="Bookman Old Style"><B>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With </B></FONT><FONT size="5"
				color="#ff0000" face="Bookman Old Style"><B>PSSR Bank Bill Payment
			Service</B></FONT><FONT
				size="5" color="#000000" face="Bookman Old Style"><B> you can now pay the following Bills :<BR>
			<BR>
			</B></FONT><br/>
			<FONT
				size="4" color="#ff0000" face="Bookman Old Style"><B>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				*Electricity<BR>
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
