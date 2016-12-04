
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
<TITLE>balance_enq.jsp</TITLE>
</HEAD>
<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>

<%
try
	{

        Class.forName("oracle.jdbc.OracleDriver");
    	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");


//    	out.println("Hi");
    	HttpSession s=request.getSession(true);
		String session_account=s.getAttribute("customer_no").toString();
		int s_a=Integer.parseInt(session_account);
		out.println("Account no :" + s_a);
    	PreparedStatement stmt=con.prepareStatement("select * from balance_enq where acc_no="+s_a);
        ResultSet rs=stmt.executeQuery();
%>
<TABLE width="1231">
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center" height="299" width="174">
            	<jsp:include page="menu_page.html" flush="true"/></TD>

            <TD height="299" align="center" width="1051"><FONT size="4"
				color="#0000a0" face="Arial Baltic"><B> </B></FONT>
				<FONT size="5" color="#0000a0" face="Arial Black"><U>Your Transaction
			Details</U>
			<U><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]</FONT></a>
			</U>

			</FONT><BR><IMG border="0" src="Image/bal.jpg" width="162" height="121">

			<br /><FONT size="4" color="#ff0000" face="Arial Black">Your Account Number is :</FONT><FONT size="4">
			<% out.println(s_a);%> </FONT><BR><BR>

			<TABLE border="1">
				<TBODY>

					<TR bgcolor="#000000">
						<TD width="221" align="center"><FONT size="4" color="#ff0000" face="Arial"><B>TRANSACTION DATE</B></FONT></TD>
						<TD width="175" align="center"><FONT size="4" color="#ff0000" face="Arial"><B>DESCRIPTION</B></FONT></TD>
						<TD width="225" align="center"><FONT size="4" color="#ff0000" face="Arial"><B>AMOUNT</B></FONT></TD>
					</TR>
<%
while(rs.next())
	{%>
 	   <tr>
           <td height="40" width="221">
           <p align="center">
	   	   <%out.println(rs.getString(2));%></p>
	  	   </td>
	  	   <td height="40" width="175">
	  	   <p align="center">
     	   <%out.println(rs.getString(3));%></p>
	       </td>
	       <td height="40" width="225">
	       <p align="center">
 		   <%out.println(rs.getDouble(4));%></p>
	  	   </td>
	   </tr>
      <% } %>
 <%
}
catch(Exception e)
{
 out.println("error"+e);
}
finally{
		//con.close();
	}

%>
    </TABLE>
<BR><table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    <td><a href="Image/home_page.jsp" ><font face="Arial" size="2" color="white"><B> HOME</B></font></a> </td></tr>
</table></TBODY>

</TABLE>
<U>
</U>

</BODY>
</HTML>
