<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<%@ page import='java.util.*'%>
<%@page import= 'java.text.*' %> 

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="refresh"  content="20000">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>recurring_deposits.jsp</TITLE>
<SCRIPT LANGUAGE="javascript">
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
function checkvalid()
{
	document.recurring_deposits.period.focus();
	if (((recurring_deposits.amount.value)%10)!=0)
	{
		alert("Amount Should be multiple of 10!");
		recurring_deposits.amount.focus();
	}
	else
	{		
		recurring_deposits.period.click();
		recurring_deposits.amount.click();	
	}
}
function clear(field)
{
//alert("inside clear");
  field.value="";
  field.focus;
}

function checkb()
{
//alert("inside checkb");
for(var i=0;i<2;i++)
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
<%HttpSession s=request.getSession(true);
String session_account=s.getAttribute("customer_no").toString();
int s_a=Integer.parseInt(session_account);
%>
<%
Date date=new Date();
DateFormat df;
df=DateFormat.getDateInstance(DateFormat.MEDIUM ,Locale.GERMAN);%>

<TABLE>
    <TBODY>
        <TR>
            <TD bgcolor="#000000" valign="top" align="center" height="463">
            	<jsp:include page="menu_page.html" flush="true"/></TD>
            
            <TD bgcolor="#000000" valign="top" align="center" width="0" height="470"></TD>
            <TD width="1099" height="470" align="center">
<form name="recurring_deposits" method="POST" action="recurring_deposits_conn.jsp">
			<TABLE width="1090" border="0" cellpadding="0" cellspacing="0">
				<TBODY>
					<TR>
						<TD height="41" align="center" colspan="2"><U><FONT size="5" color="#0000a0" face="Arial Black">RECURRING DEPOSITS</FONT> </U> <BR>
						<DIV align="right"><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]</FONT></a></DIV>
						
						<FONT color="#ff0000">( Please fill the details carefully )</FONT>
						<BR>
						<BR>
						( <FONT color="#ff0000">*</FONT> Compulsory fields )<BR>
						<BR>
						<FONT size="4" color="#ff0000" face="Arial Black">Your Account
			Number is :</FONT><FONT size="4"> <%out.println(s_a);%> </FONT><BR>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
					<TABLE border=4 align="center">
					<TR>
					<TD align="left" height="49"><FONT size="4" face="Arial Baltic" color="#ff0000">*</FONT><FONT
						size="4" face="Arial Baltic"> Enter the Period ( in Year) :</FONT></TD>
					<TD align="center" valign="middle" width="293" height="49"><INPUT
							type="text" name="period" size="28" maxlength="3" onChange="numeric(period)"></TD>
					</TR>
					<TR>
					
						<TD align="center" height="45"><FONT size="4" color="#ff0000"
						face="Arial Baltic">*</FONT> <FONT size="4" face="Arial Baltic">Enter
						the Amount</FONT><FONT size="4" face="Arial Baltic"
						color="#0000ff">*</FONT><FONT size="4" face="Arial Baltic"> ( Rs./
					Month ):</FONT></TD>
						<TD align="center" width="293" height="45"><INPUT type="text"
							name="amount" size="28" maxlength="15" onChange="numeric(amount)"></TD>
					</TR>
					<TR>
					<TD align="left" height="47"><FONT size="4" face="Arial Baltic">Today's Date
					:</FONT></TD>
					<TD align="center" width="293" height="47"><INPUT type="text"
							name="date" size="26" value="<%out.print(df.format(date)); %>"
							readonly></TD>
					</TR>
					<TR>
						<TD valign="middle" align="center" height="46"><INPUT
							type="submit" name="submit" value="SUBMIT" onFocus="checkvalid()" onClick="return checkb()"></TD>
						<TD align="center" width="293" height="46"><INPUT type="reset"
						value="RESET" onClick="clear()"></TD>
					</TR>
					</TABLE></FORM><FONT size="2" color="#0000ff" face="Arial"><B>*
			AMOUNT SHOULD BE MULTIPLE OF 10.</B></FONT><BR>
			<BR>
			<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    <td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B> HOME</B></font></a> </td></tr>
</table>
			</TD></TR></TBODY></TABLE>


</BODY>
</HTML>
