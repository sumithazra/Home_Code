<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<%@ page import='java.util.*'%>
<%@page import= 'java.text.*' %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="2000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>bill_payment2.jsp</TITLE>
<BODY background="Image/background.gif">
<SCRIPT LANGUAGE="javascript">

function clear(field)
{
//alert("inside clear");
  field.value="";
  field.focus;
}

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

function checkb()
{
//alert("inside checkb");
for(var i=4;i<6;i++)
	{
	if(document.forms[0].elements[i].value=="")
		{
		alert("Field left blank");
		document.forms[0].elements[i].focus;
		return false;
		}
	}
}
</SCRIPT>

</HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%
HttpSession s=request.getSession(true);
String session_account=s.getAttribute("customer_no").toString();
int s_a=Integer.parseInt(session_account);
%>
<%Date date=new Date();
DateFormat df;
df=DateFormat.getDateInstance(DateFormat.MEDIUM ,Locale.GERMAN);%>

<TABLE>
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center" height="499">
            	<jsp:include page="menu_page.html" flush="true"/></TD>
			<TD align="center" valign="middle" width="1069" height="499">
			<form name="bill_payment2" method="POST" action="bill_payment_conn.jsp">
			<TABLE width="634" border="0" cellpadding="0" cellspacing="0"
				height="255">
			</TABLE>

			<IMG border="0" src="Image\bill.gif" width="53" height="30"><U><FONT size="5" color="#0000a0" face="Arial Black">BILLS PAYMENT</FONT></U>
			<DIV align="right"><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]</FONT></a></DIV>
				<FONT color="#ff0000">( Please fill the details carefully )</FONT> <BR>
			<BR>
			( <FONT color="#ff0000">*</FONT> Compulsory fields )<BR>
			<FONT size="4"><BR>
			</FONT><FONT size="4" color="#ff0000" face="Arial Black">Your Account
			Number is :</FONT><FONT size="4"> <%out.println(s_a);%> </FONT><BR>
			<BR>
			<TABLE width="642" border="4" cellpadding="0" cellspacing="0"
				height="235" align="center">
				<TBODY>
					<TR>
						<TD align="left" height="46" width="350"><FONT size="4"
							face="Arial Baltic" color="#ff0000">*</FONT><FONT size="4"
							face="Arial Baltic"> Select the Bill Type :</FONT></TD>
						<TD align="center" height="46" width="292"><INPUT type="radio"
							name="r1" value="Electricity" checked>Electricity <INPUT
							type="radio" name="r1" value="Water">Water <BR>
						<INPUT type="radio" name="r1" value="Telephone">Telephone <INPUT
							type="radio" name="r1" value="Mobile">Mobile</TD>
					</TR>
					<TR>
						<TD align="left" height="44" width="350"><FONT size="4"
							face="Arial Baltic" color="#ff0000">*</FONT><FONT size="4"
							face="Arial Baltic">Enter the Bill Number :</FONT></TD>
						<TD align="center" height="44" width="292"><INPUT type="text"
							name="bill_no" size="25" maxlength="20"
							onChange="numeric(bill_no)"></TD>
					</TR>
					<TR>
						<TD align="left" height="48" width="350"><FONT size="4"
							face="Arial Baltic" color="#ff0000">* </FONT><FONT size="4"
							face="Arial Baltic">Enter the Amount to be Paid ( in Rs.):</FONT></TD>
						<TD align="center" height="48" width="292"><INPUT type="text"
							name="amount" size="25" maxlength="15" onChange="numeric(amount)"></TD>
					</TR>
					<TR>
						<TD align="left" height="48" width="350"><FONT size="4"
							face="Arial Baltic" color="#ff0000"></FONT><FONT size="4"
							face="Arial Baltic"> Today's Date :</FONT></TD>
						<TD align="center" height="48" width="292"><INPUT type="text"
							name="date" size="25" maxlength="10" value="<%out.print(df.format(date)); %>"readonly></TD>
					</TR>
					<TR>
						<TD align="center" width="350" height="47"><INPUT type="submit"
							name="submit" value="SUBMIT" onClick="return checkb()"></TD>
						<TD align="center" width="292" height="47"><INPUT type="reset"
							value="RESET" onClick="clear()"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</form>
			<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    <td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B> HOME</B></font></a> </td></tr>
</table>
		</TD>
		</TR>
    </TBODY>
</TABLE>

</BODY>
</HTML>
