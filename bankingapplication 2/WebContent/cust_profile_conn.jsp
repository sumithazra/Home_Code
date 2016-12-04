
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<%@ page import='java.sql.*'%>
<%@ page import='javax.servlet.http.*'%>

<TITLE>cust_profile_conn.jsp</TITLE>
</HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>

<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

	    String marital_stat=request.getParameter("r1");

		String occ=request.getParameter("occupation");
		out.println(occ);
		String address=request.getParameter("address");
		     	out.println(address);
		String city=request.getParameter("city");
		     	out.println(city);
		String state=request.getParameter("state");
		     	out.println(state);
		String country=request.getParameter("country");
		out.println(country);


		int zipcode=Integer.parseInt(request.getParameter("zipcode"));
		out.println(zipcode);
        	String email=request.getParameter("email");
		out.println(email);

		String landline=request.getParameter("landline");
		out.println(landline);

		String mobile=request.getParameter("mobile");
		out.println(mobile);

		PreparedStatement stmt2=con.prepareStatement("update cust_info_tab set cust_occupation =?");
		stmt2.setString(1,occ);
	       /* PreparedStatement stmt2=con.prepareStatement("insert into cust_info_tab(marital_status,occupation,address,city,state,country,zip,tel_landline,tel_mobile,email) values(?,?,?,?,?,?,?,?,?,?)");
     		stmt2.setString(7,marital_stat);
     		stmt2.setString(8,occ);
     		stmt2.setString(9,address);
			stmt2.setString(10,city);
			stmt2.setString(11,state);
			stmt2.setString(12,country);
			stmt2.setInt(13,zipcode);
			stmt2.setString(14,landline);
			stmt2.setString(15,mobile);
			stmt2.setString(16,email);
     		*/
			stmt2.executeUpdate();
%>
			<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
			Your given information is updated now.<BR></FONT></P>
			<P align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>

<%

%>
</BODY>
</HTML>
