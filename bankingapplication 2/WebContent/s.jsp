<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" import="model.connDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","system","iprimed@123");

    HttpSession s=request.getSession(true);
String session_account=(String)s.getAttribute("customer_no");
int s_a=Integer.parseInt(session_account);

	    String marital_stat=request.getParameter("r1");

		String occ=request.getParameter("occupation");


		String address=request.getParameter("address");

		String city=request.getParameter("city");

		String state=request.getParameter("state");

		String country=request.getParameter("country");



		int zipcode=Integer.parseInt(request.getParameter("zipcode"));

        	String email=request.getParameter("email");



		String landline=request.getParameter("landline");


		String mobile=request.getParameter("mobile");


		PreparedStatement stmt2=con.prepareStatement("update cust_info_tab set cust_occupation =? , cust_address=?,cust_city=?,cust_state=?,cust_country=?,cust_zip=?,cust_email=?,cust_tel_land=?,cust_tel_mobile=? where cust_acc_no='"+s_a+"' ");
		stmt2.setString(1,occ);
		stmt2.setString(2,address);
		stmt2.setString(3,city);
		stmt2.setString(4,state);
		stmt2.setString(5,country);
		stmt2.setInt(6,zipcode);
		stmt2.setString(7,email);
		stmt2.setString(8,landline);
		stmt2.setString(9,mobile);
		stmt2.executeUpdate();

%>
			<P align="center"><FONT size="5" color="#ff0000" face="Arial Black"><BR>
			Your given information is updated now.<BR></FONT></P>
			<P align="center">&lt;&lt;<B> <A href="home_page.jsp"><FONT size="5" color="#0000a0" face="Arial">Back</FONT></A></B></p>

<%

	%>
</body>
</html>
