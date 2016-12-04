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
<TITLE>verify_new_user.jsp</TITLE>
<script language="javascript">
function numeric(field)
{
   var num=field.value;
   var len=num.length;
   if(len<11)
   {
   var num_reg=new RegExp("^[\\d]+$","g");
      if(!(num.match(num_reg)))
       {
       alert(field.name+" should contain numbers only");

            clear(field);
       }
       else  {  return true;
         }
   }

}
function clear(field)
{
//alert("inside clear");
  field.value="";
  field.focus;
}
</script>
</HEAD>
<BODY background="Image/background.gif">

<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>

<TABLE>
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center">
            	<jsp:include page="menu.html" flush="true"/></TD>
			<TD width="639" align="center">
			<form name="admin_menu" method="POST" action="about_us.jsp">
				<FONT
				size="5" color="#004080" face="Arial Black">
				<a href="verify_new_userconn">VERIFY NEW USER</a>
				</FONT>
				<br>
				<DIV align="right">
				<a href="admin_logout.jsp"><FONT size="3" color="#ff0000" face="Arial"> [ Log Out ] </FONT></a></DIV>
				<%//shifted to verify_new_userconn.java							%>
			</form>


			<form name="login_page" method="POST" action="store_conn">
                            <table>
                                <tr><td><font size="4" color="#ffffff" face="Arial Black">
				Please Enter the verified account Number : </font>
                                <td><INPUT type="text" name="account_no" size="20" maxlength="10" onChange="numeric(account_no)">
                                <tr><td><FONT size="4" color="#ffffff" face="Arial Black">Please enter the initial amount:</FONT>
                                    <td><INPUT type="text" name="balance" size="20" maxlength="10" onChange="numeric(balance)">

                                <tr><td><strong><font color="#FFffff" size="+2">Please give password:</font></strong>
                                    <td><INPUT type="password" name="pass_word" size="20" maxlength="10">
                                <tr><td>
			<INPUT type="submit" name="submit" value="SUBMIT"><BR>
                        </table>
			</form>
                        <br><br>
			<form name="login1" method="POST" action="invalid_user_conn.jsp">
			<FONT size="4" color="#ff0000" face="Arial Black">Please Enter the
					Account Number to delete :</FONT> <INPUT type="text"
				name="account_no1" size="20" maxlength="10"
				onchange="numeric(account_no1)"><BR>
			<BR>
			<INPUT type="submit" name="delete" value="DELETE"><BR>
			<BR>
			</form>
</TABLE>
</BODY>
</HTML>