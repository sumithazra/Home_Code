
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML>
<HEAD>
<%@ page import='java.sql.*' %>
<%@ page import='javax.servlet.http.*' %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>view_cust_profile.jsp</TITLE>
</HEAD>

<BODY background="Image/background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<TABLE width="276">
	<TBODY>
		<TR>
			<TD bgcolor="#000000" valign="top" align="center" height="322"><jsp:include
				page="menu.html" flush="true" /></TD>
			<TD align="center" height="322" width="1102">
			<form name="admin_menu" method="POST" action="Image\about_us.jsp"><FONT
				size="5" color="#004080" face="Arial Black"><U>VIEW CUSTOMER PROFILE</U></FONT><BR>
			<DIV align="right"><a href="admin_logout.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]<BR>
			<br></FONT></a></DIV>
			<BR>
	<% try
	{
		//String  user_id1=request.getParameter("user_id");
		HttpSession s1=request.getSession(true);
		String session_account1=(String)s1.getAttribute("user_id");
		//int u_id=Integer.parseInt(session_account);

    	Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

       	PreparedStatement stmt1=con.prepareStatement("select * from cust_info_tab");
        ResultSet rs1=stmt1.executeQuery();
         //PreparedStatement stmt2=con.prepareStatement("select * from admin_info_tab");
        //ResultSet rs2=stmt2.executeQuery();
%>
			<TABLE width="926">
				<TBODY>
					<form name="view_cust_profile" method="POST">
					<TABLE border="1">
						<TBODY>
							<TR>
								<TD align="center" bgcolor="black" width="83" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">ACCOUNT No.</FONT></B></TD>
								<TD align="center" bgcolor="black" width="83" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">ACCOUNT TYPE</FONT></B></TD>
								<TD align="center" bgcolor="black" width="131" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">NAME</FONT></B></TD>
								<TD align="center" bgcolor="black" width="111" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">DATE OF BIRTH</FONT></B></TD>
								<TD align="center" bgcolor="black" width="55" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">SEX</FONT></B></TD>
								<TD align="center" bgcolor="black" width="119" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">MARITAL STATUS</FONT></B></TD>
								<TD align="center" bgcolor="black" height="37"><B><FONT size="4"
									color="#ff0000" face="Arial">OCCUPATION</FONT></B></TD>
								<TD align="center" bgcolor="black" width="149" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">ADDRESS</FONT></B></TD>
								<TD align="center" bgcolor="black" width="114" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">PHONE NO.</FONT></B></TD>
								<TD align="center" bgcolor="black" width="114" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">MOBILE NO.</FONT></B></TD>
								<TD align="center" bgcolor="black" width="114" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">EMAIL</FONT></B></TD>
								<TD align="center" bgcolor="black" width="63" height="37"><B><FONT
									size="4" color="#ff0000" face="Arial">BALANCE</FONT></B></TD>
							</TR>
							<% while(rs1.next())//displaying values on the screen
   { %>
							<tr>

								<td height="40" width="95"><%out.println(rs1.getInt(1));%>
								<td width="109" height="40">
								<p><%out.println(rs1.getString(2));%></p>	</td>

								<td width="109" height="40">
								<p align="center"><%if(rs1.getString(4)==null)
	   								out.println(rs1.getString(3)+" "+rs1.getString(5));
	   	 						else
	   								out.println(rs1.getString(3)+" "+rs1.getString(4)+" "+rs1.getString(5));%></p>		</td>
								<td height="40" width="73">
								<p align="center"><%out.println(rs1.getString(6));%></p>								</td>
								<td width="109" height="40">
								<p align="center"><%out.println(rs1.getString(7));%></p>								</td>
								<td width="109" height="40">
								<p align="center"><%out.println(rs1.getString(8));%></p>								</td>
								<td width="109" height="40">
								<p align="center"><%out.println(rs1.getString(9));%></p>								</td>
								<td width="109" height="40">
								<p align="center"><%out.println(rs1.getString(10)+", "+rs1.getString(11)+", "+rs1.getString(12)+", "+rs1.getString(13)+", "+rs1.getString(14));%></p>								</td>
								<td width="109" height="40">
								  <p align="center">
								    <%out.println(rs1.getString(15));%>
							  </p></td>
							<td width="109" height="40">
								  <p align="center">
								    <%out.println(rs1.getString(16));%>
							  </p></td>

								<td width="109" height="40">
								<p align="center"><%out.println(rs1.getString(17));%></p>								</td>

								<td width="109" height="40">
								<p align="center"><%out.println(rs1.getDouble(18));%></p>								</td>
							</tr>
							<%}%>
						</tbody>
					</TABLE>
					</form>
				</TBODY>

			</TABLE>


			<%}
catch(Exception e)
{
 System.out.println("error"+e);
}
 %></form>

</TABLE>
<table align="center" bgColor="#0080c0" border="2" cellPadding="7"
				cellSpacing="1" align="center">
				<tr onMouseOver="this.bgColor='#336699';"
					onMouseOut="this.bgColor='#0080c0';">
					<td><a href="admin_menu.html"><font face="Arial" size="2"
						color="white"><B>Admin Menu</B></font></a></td>
				</tr>
			</table></BODY>
</HTML>
