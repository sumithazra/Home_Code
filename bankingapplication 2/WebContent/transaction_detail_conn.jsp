
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<%@ page import='java.sql.*' %>
<%@ page import='javax.servlet.http.*' %>
<%@ page import='java.util.*'%>
<%@ page import='java.text.*'%>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="20000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>transaction_detail_conn.jsp</TITLE>
</HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>

<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","iprimed@123");

	try
	{
	 	HttpSession s=request.getSession(true);
		String session_account=(String)s.getAttribute("customer_no");
		int s_a=Integer.parseInt(session_account);

		//int start_date1=Integer.parseInt(request.getParameter("start_date"));
		//int end_date1=Integer.parseInt(request.getParameter("end_date"));
		//String start_date1=request.getParameter("start_date");
		//Date n=new Date();
		//DateFormat df=DateFormat.
		//n= "start_date1";
		// st_d1=new Date(start_date1);
		String end_date1=request.getParameter("end_date");


		PreparedStatement stmt1=con.prepareStatement("select * from balance_enq where bal_date>='start_date1' and bal_date<='end_date1' and acc_no="+s_a);
     	ResultSet rs1=stmt1.executeQuery();
%>
<P align="center"><FONT size="5" color="#004080" face="Arial Black"><U>TRANSACTION DETAILS</U></FONT>
<DIV align="right"><a href="log_out.jsp"><FONT size="3" color="#ff0000" face="Arial"> [ Log Out ]</FONT></a></DIV>
<TABLE border="4" width="630" align="center">
				<TBODY>

					<TR bgcolor="#000000">
						<TD width="221" align="center" bgcolor="#000000"><FONT size="4" color="#ff0000" face="Arial"><B>DATE</B></FONT></TD>
						<TD align="center" bgcolor="#000000" width="191"><FONT size="4" color="#ff0000" face="Arial"><B>DESCRIPTION</B></FONT></TD>
						<TD align="center" bgcolor="#000000" width="209"><FONT size="4" color="#ff0000" face="Arial"><B>AMOUNT</B></FONT></TD>
					</TR>

 	   <tr>
           <td height="40" width="221">
           <p align="center">
	   	   <%out.println(rs1.getString(3));%></p>
	  	   </td>
	  	   <td height="40" width="191">
	  	   <p align="center">
     	   <%out.println(rs1.getString(4));%></p>
	       </td>
	       <td height="40" width="209">
	       <p align="center">
 		   <%out.println(rs1.getDouble(5));%></p>
	  	   </td>
	   </tr>
	</TBODY>

    </TABLE>
<%}
	catch (SQLException e)
	{
		System.out.println(e.getMessage());
		System.out.println(e.getErrorCode());
		e.printStackTrace();
	}
%>
<P><BR>
</P>
<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
			<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    			<td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B> HOME</B></font></a></td>
    			<td><a href="balance_enq.jsp" ><font face="Arial" size="2" color="white"><B> BACK</B></font></a> </td>

    		</tr>
		</table>
</BODY>
</HTML>
