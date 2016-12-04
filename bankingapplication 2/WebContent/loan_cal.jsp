<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>loan_cal.jsp</TITLE>
<script language="JavaScript">
function calculate() {
    // Get the user's input from the form. Assume it is all valid.
    // Convert interest from a percentage to a decimal, and convert from
    // an annual rate to a monthly rate. Convert payment period in years
    // to the number of monthly payments.
    var principal = document.loandata.principal.value;
    var interest = document.loandata.interest.value / 100 / 12;
    var payments = document.loandata.years.value * 12;

    // Now compute the monthly payment figure, using esoteric math.
    var x = Math.pow(1 + interest, payments);
    var monthly = (principal*x*interest)/(x-1);

    // Check that the result is a finite number. If so, display the results
    if (!isNaN(monthly) && 
        (monthly != Number.POSITIVE_INFINITY) &&
        (monthly != Number.NEGATIVE_INFINITY)) {

        document.loandata.payment.value = round(monthly);
        document.loandata.total.value = round(monthly * payments);
        document.loandata.totalinterest.value = 
            round((monthly * payments) - principal);
    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.loandata.payment.value = "";
        document.loandata.total.value = "";
        document.loandata.totalinterest.value = "";
    }
}

// This simple method rounds a number to two decimal places.
function round(x) {
  return Math.round(x*100)/100;
}
</script>

</HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>

<TABLE height="419">
    <TBODY>
        <TR>
           <TD width="1220">
<form name="loandata">
			<table border="1" align="center" height="96" width="657">
				<tr>
					<td colspan="3" height="41" align="center"><FONT size="4"
						color="#0000a0" face="Arial Black"><U><IMG border="0"
						src="Image\calculator1.gif" width="81" height="63">LOAN CALCULATOR</U></FONT></td>
				</tr>
				<tr>
					<td colspan="3" height="41" align="center" bgcolor="#ffffff"><FONT size="4"
						color="#ff0000" face="Arial Black"><B>ENTER THE LOAN INFORMATION :</B></FONT></td>
				</tr>
				<tr>
					<td height="31" width="22"><FONT size="4" color="#000000" face="Arial Baltic">1)</FONT></td>
					<td height="31" width="349"><FONT size="4" color="#000000" face="Arial Baltic">Amount of the loan :</FONT></td>
					<td width="278" height="31" align="center"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="text" name="principal" size="21" onChange="calculate();"></FONT></td>
				</tr>
				<tr>
					<td height="32" width="22"><FONT size="4" color="#000000" face="Arial Baltic">2)</FONT></td>
					<td height="32" width="349"><FONT size="4" color="#000000" face="Arial Baltic">Annual percentage rate of interest:</FONT></td>
					<td width="278" height="32" align="center"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="text" name="interest" size="21" onChange="calculate();"></FONT></td>
				</tr>
				<tr>
					<td height="32" width="22"><FONT size="4" color="#000000" face="Arial Baltic">3)</FONT></td>
					<td height="32" width="349"><FONT size="4" color="#000000" face="Arial Baltic">Repayment period in years:</FONT></td>
					<td width="278" height="32" align="center"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="text" name="years" size="21" onChange="calculate();"></FONT></td>
				</tr>
				<tr>
					<td colspan="3" valign="middle" align="center" height="35"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="button" value="COMPUTE" onClick="calculate();"></FONT></td>
				</tr>
				<tr>
					<td colspan="3" height="37" align="center" bgcolor="#ffffff"><FONT size="4"
						color="#ff0000" face="Arial Black"><B>PAYMENT INFORMATION :</B></FONT></td>
				</tr>
				<tr>
					<td height="35" width="22"><FONT size="4" color="#000000" face="Arial Baltic">4)</FONT></td>
					<td height="35" width="349"><FONT size="4" color="#000000" face="Arial Baltic">Your monthly payment will be:</FONT></td>
					<td width="278" height="35" align="center"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="text" name="payment" size="21"></FONT></td>
				</tr>
				<tr>
					<td height="33" width="22"><FONT size="4" color="#000000" face="Arial Baltic">5)</FONT></td>
					<td height="33" width="349"><FONT size="4" color="#000000" face="Arial Baltic">Your total payment will be:</FONT></td>
					<td width="278" height="33" align="center"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="text" name="total" size="21"></FONT></td>
				</tr>
				<tr>
					<td height="34" width="22"><FONT size="4" color="#000000" face="Arial Baltic">6)</FONT></td>
					<td height="34" width="349"><FONT size="4" color="#000000" face="Arial Baltic">Your total interest payments will be:</FONT></td>
					<td width="278" height="34" align="center"><FONT size="4" color="#000000" face="Arial Baltic"><INPUT type="text" name="totalinterest" size="21"></FONT></td>
				</tr>
			</table>
			</form>
			<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
			<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    			<td><a href="customer_login.jsp" ><font face="Arial" size="2" color="white"><B> BACK</B></font></a></td>
    			
    		</tr>
			</table></TABLE>

</BODY>
</HTML>
