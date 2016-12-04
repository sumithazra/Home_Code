<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<TABLE>
		<TBODY>
				<form name=admin_view method=POST>
				<TABLE border=1>
				<TBODY>
					<TR bgcolor=#000000>
					<TD width=64 align=center height=82><FONT size=4 color=#ff0000 face=Arial color="Black">ACCOUNT NO.</FONT></TD>
					<TD width=64 align=center height=82><FONT size=4 color=#ff0000 face=Arial color="Black">ACCOUNT TYPE</FONT></TD>
					<TD width=98 align=center height=82><FONT size=4 color=#ff0000 face=Arial color="Black">NAME</FONT></TD>
					<TD width=56 align=center height=82><FONT size=4 color=#ff0000 face=Arial color="Black">DATE OF BIRTH</FONT></TD>
					<TD width=51 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>SEX</FONT></TD>
					<TD width=66 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>MARITAL STATUS</FONT></TD>
					<TD width=55 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>OCCUPATION</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>ADDRESS</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>CITY</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>STATE</FONT></TD>					
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>COUNTRY</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>ZIPCODE</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>PHONE</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>MOBILE</FONT></TD>
					<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial color=Black>EMAIL</FONT></TD>
					</TR>
				</TBODY>
				</TABLE>
				</form>
	</TBODY>
</TABLE>
</body>
</html>