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
<TITLE>money_transfer2.jsp</TITLE>
<SCRIPT LANGUAGE="javascript">
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
            <TD bgcolor="#000000" valign="top" align="center" height="485">
            	<jsp:include page="menu_page.html" flush="true"/></TD>
			<TD align="center" valign="middle" width="1097" height="485">
			<form name="money_transfer2" method="POST" action="money_transfe_conn.jsp">
			<FONT size="5" color="#0000a0" face="Arial Black"><U>MONEY TRANSFER</U></FONT>
			<DIV align="right"><a href="log_out.jsp"><FONT size="3"
				color="#ff0000" face="Arial"> [ Log Out ]</FONT></a></DIV><FONT color="#ff0000">( Please fill the details carefully )</FONT><BR>
			<BR>( <FONT color="#ff0000">*</FONT> Compulsory fields )<BR>
			<BR>
			<FONT size="4" color="#ff0000" face="Arial Black">Your Account Number
			is :</FONT><FONT size="5" color="#ff0000" face="Arial Black"> </FONT><%out.println(s_a);%><BR>
			<BR><TABLE width="671" border="1" cellpadding="0" cellspacing="0" align="center">
				<TBODY>
				<TR>
					<TD align="left" height="50" width="350"><FONT size="4"
						face="Arial Baltic" color="#ff0000">*</FONT><FONT size="4"
						face="Arial Baltic"> Enter Amount to be transfered ( in Rs. ) :</FONT></TD>
					<TD align="center" height="50" width="319"><INPUT type="text"
						name="amount" size="31" maxlength="15" title="Amount should contain NUMBERS only." onChange="numeric(amount)"></TD>
				</TR>
				<TR>
					<TD align="left" height="44" width="350"><FONT size="4"
						face="Arial Baltic" color="#ff0000">*</FONT><FONT size="4"
						face="Arial Baltic"> Enter the Receiver's Account Number :</FONT></TD>
					<TD align="center" height="44" width="319"><INPUT type="text"
						name="rec_acc_no" size="31" maxlength="15" title="Account Number should contain NUMBERS only." onChange="numeric(rec_acc_no)"></TD>
				</TR>
				<TR>
					<TD height="53" width="350"><FONT size="4" face="Arial Baltic"
						color="#ff0000">*</FONT><FONT size="4" face="Arial Baltic"> Today's
					 Date     :</FONT></TD>
					<TD align="center" height="53" width="319">
                                            <INPUT type="text" name="date" size="31" maxlength="10" value="<%out.print(df.format(date)); %>"readonly></TD>
				</TR>
				<TR>
					<TD align="center" height="68" width="350"><INPUT type="submit"
						name="submit" value="SUBMIT" onClick="return checkb()"></TD>
					<TD align="center" height="68" width="319"><INPUT type="reset" value="RESET" onClick="clear()"></TD>
				</TR>
				</TBODY>
			</TABLE>
			</form>
			<BR>
			<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
			<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    			<td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B> HOME</B></font></a></td>
    			<td><a href="money_transfer2.jsp" ><font face="Arial" size="2" color="white"><B>BACK</B></font></a> </td>    			
    		</tr>
			</table>
			</TD>
		</TR>
    </TBODY>
</TABLE>

</BODY>
</HTML>