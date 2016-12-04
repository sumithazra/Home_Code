
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="errorHandler.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Account No and Password details</title>
</head>

<body  background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<TABLE width="1202">
	<TBODY>
		<TR>
			<TD bgcolor="white" valign="top" align="center" height="322"><jsp:include
				page="menu.html" flush="true" /></TD>
			<TD align="center" height="322" width="1102">
			<DIV align="center"><a href="admin_logout.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]<BR>
			<br></FONT></a></DIV>
			<BR>

<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","bank","bank");

PreparedStatement stmt5=con.prepareStatement("select * from login_tab");
PreparedStatement stmt6=con.prepareStatement("select * from cust_info_tab where cust_acc_no=?");
ResultSet rs=stmt5.executeQuery();
if(rs.next())
    {
	//rs.first();
	System.out.println("if");
%>

<div align="left">
<br /><br /><br />
<table border="1">
<tr>

 <td width="79"><strong><font color="">Acc_no</font></strong></td>
  <td width="78"><strong><font color="#FFFFFF">Password</font></strong></td>
  <td width="59"><strong><font color="#FFFFFF">Name</font></strong></td>
   <td width="85"><strong><font color="#FFFFFF">Address</font></strong></td>
   <td width="100"><strong><font color="#FFFFFF">DOB</font></strong></td>

</tr>
<%
do
{
%>
<tr>

 <td><%=rs.getString(1)%></font>
</td>
 <td><%=rs.getString(2)%></font></td>

<%
System.out.print("do");
stmt6.setInt(1,rs.getInt(1));
ResultSet rs1= stmt6.executeQuery();

rs1.next();
%><td><%
out.println(rs1.getString(3)+" "+rs1.getString(4));
%></font></td><td><%
out.println(rs1.getString(10));
%></font></td><td><%
out.println((rs1.getString(6).split("-"))[2]+"-"+(rs1.getString(6).split("-"))[1]+"-"+(rs1.getString(6).split("-"))[0]);
%>
</font>
</td>
</tr>
<%System.out.print("do end");
}while(rs.next());
}
else
    {
%>
<h4 align="center">No new records found.</h4>
<%
    }
%>
</table>
<br />
<table align="left" bgColor="#0080c0" border="2" cellPadding="7"
				cellSpacing="1" align="center">
				<tr onMouseOver="this.bgColor='#336699';"
					onMouseOut="this.bgColor='#0080c0';">
					<td><a href="admin_menu.html"><font face="Arial" size="2"
						color="white"><B>Go Back</B></font></a></td>
				</tr>
			</table>
</div>
</body>
</html>