<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<%@ page import='java.sql.*' %>
<%@ page import='javax.servlet.http.*' %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="20000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>BANKING HOME PAGE</TITLE>
</HEAD>
<BODY background="Image/background.gif">
<jsp:include page="logo_page1.html" flush="true"/>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

HttpSession s=request.getSession(true);
String session_account=s.getAttribute("customer_no").toString();
int s_a=Integer.parseInt(session_account);
%>
<TABLE>
 <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center">
            	<jsp:include page="menu_page.html" flush="true"/></TD>

			<TD width="1107" align="center">
			<form name="about_us" method="POST" action="about_us.jsp">
			<DIV><FONT size="5" color="#0000a0" face="Arial Black">
<%
			//<IMG border="0" src="Image\home2.jpg" width="102" height="99">HOME PAGE</U></FONT></DIV>
			PreparedStatement stmt1=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
     		ResultSet rs1=stmt1.executeQuery();
	 		rs1.next();
	 	   	String name1="";
	 	   	name1=rs1.getString(3);
%>
		<div align="right"><a href="log_out.jsp"><FONT size="3" color="#ff0000" face="Arial"> [ Log Out ]</FONT></a></DIV></P>
			<div align="left"><FONT size="5" color="#ff0000" face="Arial Black">Welcome Customer <%out.println(name1);%></FONT></div>

			<TABLE border="2" bgcolor="blue">
				<TBODY>
					<TR>
						<TD width="877" align="center"><marquee width="880"><FONT size="4" color="#ffffff"
							face="Arial"><B>Complete &nbsp;&nbsp;  Banking &nbsp;&nbsp; Solution</B></FONT></marquee></TD>
					</TR>
				</TBODY>
			</TABLE>

			<IMG border="0" src="Image/atwhichstage_banner.GIF" width="399" height="79"><BR>

			<FONT size="4" color="#000000" face="Arial Black"><BR>
			Financial well-being starts with prudent planning and allocation of
			money.<BR>
			Use our expertise to manage your personal finances better. Managing
			money can be fun!<BR>
			Discover how, with PSSR Bank</FONT>.<BR>
			<FONT
				size="4" color="#0080ff" face="Arial Black"><B>FIND THE RIGHT TO
			KEEP YOUR MONEY SECURE !</B></FONT><FONT
				color="#0080ff"><BR>
			<BR>
			<IMG border="0" src="Image/mbm.gif" width="359" height="118"><BR></FONT></div>
			</form>
		    </TD>
		</TR>
	</TBODY>
</TABLE>


</BODY>
</HTML>
