
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD>
<%@ page import='java.sql.*' %>
<%@ page import='javax.servlet.http.*' %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="20000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>view_details.jsp</TITLE>

</HEAD>
<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%
	try
	{
		 Class.forName("oracle.jdbc.OracleDriver");
	     Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","bank","bank");

    	HttpSession s=request.getSession(true);
		String session_account=(String)s.getAttribute("customer_no");
		int s_a=Integer.parseInt(session_account);
%>
<TABLE>
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center">
            	<jsp:include page="menu_page.html" flush="true"/></TD>
            <TD height="299" align="center" width="1106"><FONT size="4"
				color="#0000a0" face="Arial Baltic"><B> </B></FONT><FONT
				size="5" color="#0000a0" face="Arial Black"><U><IMG border="0"
				src="Image/view details.GIF" width="57" height="46">ACCOUNT DETAILS</U></FONT>
			<DIV align="right"><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]</FONT></a></DIV>
			<BR>
			<FONT size="4" color="#ff0000" face="Arial Black">Your Account Number is :</FONT><FONT size="4"> <%out.println(s_a);%> </FONT><BR>
			<BR>
			<%
		PreparedStatement stmt2=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
     	ResultSet rs1=stmt2.executeQuery();
			rs1.next();
			%>
			<FONT size="4" color="#ff0000" face="Arial Black">Your account
			type is:</FONT><%out.println(rs1.getString(2));%>
			<BR>
			<BR>
			<FONT size="4" color="#ff0000" face="Arial Black">Your Balance amount
			is:</FONT><%out.println(rs1.getDouble(18));%>
			<BR>
			<FONT color="#ff0000"><BR>
			[ In case of any discrepancies in your details please send an email to pssr_dynamos@gmail.com. ]</FONT><BR><BR>

<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    <td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B> HOME</B></font></a> </td></tr>
</table>
    </TBODY>
</TABLE>
<%
	}
	catch(Exception e)
	{
	 	System.out.println("error"+e);
	}
%>

</BODY>
</HTML>
