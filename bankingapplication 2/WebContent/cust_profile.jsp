<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="errorHandler.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<%@ page import='java.sql.*' %>
<%@ page import='javax.servlet.http.*' %>

<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>cust_profile</TITLE>
<SCRIPT type="text/javascript">

function clear(field)
{
//alert("inside clear");
  field.value="";
  field.focus;
}

function checkalpha(field)
{
    var getdata=field.value;
   //alert(getdata);
    var len=getdata.length;
    var alpha=new RegExp("^[A-Za-z]+|[\s]","g");
    var digi=new RegExp("[\\d]","g");
    if(getdata.match(alpha) && !(getdata.match(digi)))
    {
       //return true;
        // alert("ok");
    }
    else
    {

    alert(field.name+" should contain alphabets only");
         clear(field);
        // return false;
    }
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

function valemail(field)
    {
       var mail=field.value;
       var reg1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)|[\s]/;
       var reg2 = /^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/;
       if (!(!reg1.test(mail) && reg2.test(mail)))
          {
            clear(field);
           // return false;
           alert("Enter valid EMAIL-ID only");
          }
          else
          {

            // return true;
          }

}

function alphanumeric(field)
{
    var getalpha=field.value;
    var flag=0;
    var len=getalpha.length;
    if(len>0)
    {
      var st=new RegExp("[A-Za-z]","g");
      var ed=new RegExp("[\\d]","g");
      if(getalpha.match(st) || getalpha.match(ed))
      {
      	// alert("ok");
         flag=1;
      }
    }
    if(flag==0)
    {
         alert("Improper input: "+getalpha);
         clear(field);
    }
}

function checkb()
{
 document.cust_profile.submit();
}

</SCRIPT></HEAD>
<BODY background="Image\background.gif">
<div align="center">
<jsp:include page="logo_page1.html" flush="true"/>
</div>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

HttpSession s=request.getSession(true);
String session_account=(String)s.getAttribute("customer_no");
int s_a=Integer.parseInt(session_account);

     PreparedStatement stmt1=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
     ResultSet rs1=stmt1.executeQuery();
		if(rs1.first())
		 {


%>
<br><br><br>
<DIV align="center">
<TABLE width="600">
	<TBODY>
		<TR>
			<TD height="56" width="487">
			<form name="cust_profile" method="POST" action="s.jsp">

			<center>
			<h1><FONT size="3" face="Arial"><U><FONT color="#000080" size="5"
				face="Arial Black"><IMG border="0" src="Image\register2.jpg" width="135"
				height="94">Update your profile</FONT></U></FONT></h1><FONT size="3"
				color="#000000" face="Arial Baltic"><BR>
			</FONT><FONT size="3" color="#ff0000" face="Arial Baltic"> <BR>
			( Please fill the details carefully )</FONT></center>
	</TBODY>
</TABLE>
<BR>
<TABLE width="591" border="2" cellpadding="0" cellspacing="0">
	<TBODY align="center">
		<TR>
			<TD height="54" width="264"><FONT size="4" face="Arial">Marital
			status :</FONT></TD>
			<TD height="54" width="323"><INPUT type="radio" name="marital_status" value="married"
				checked><FONT size="3" face="Arial">Married</FONT> <INPUT
				type="radio" name="marital_status" value="single"><FONT size="3"
				face="Arial">Single</FONT></TD>
		</TR>
		<TR>
			<TD height="51" width="264"><FONT size="4" face="Arial">Occupation :</FONT></td>
			  <td><input type="text" name="occupation" value="<%=rs1.getString("cust_occupation")%>"
				size="30" onChange="checkalpha(occupation)">
			</TD>

		</TR>
		<TR>
			<TD height="51" width="264"><FONT size="4" face="Arial">Address :</FONT></TD>
			<TD height="51" width="323"><INPUT type="text" name="address" value="<%=rs1.getString("cust_address")%>"
				size="30" onChange="alphanumeric(address)"></TD>
		</TR>
		<TR>
			<TD height="52" width="264"><FONT size="4" face="Arial">City :</FONT></TD>
			<TD height="52" width="323"><INPUT type="text" name="city"  value="<%=rs1.getString("cust_city")%>" size="30" onChange="checkAlpha(city)"></TD>
		</TR>
		<TR>
			<TD height="53" width="264"><FONT size="4" face="Arial">State :</FONT></TD>
			<TD height="53" width="323"><INPUT type="text" name="state" value="<%=rs1.getString("cust_state")%>" size="30" onChange="checkAlpha(state)"></TD>
		</TR>
		<TR>
			<TD height="59" width="264"><FONT size="4" face="Arial">Country :</FONT></TD>
			<TD height="59" width="323"><INPUT type="text" value="<%=rs1.getString("cust_country")%>" name="country"
				size="30" onChange="checkAlpha"></TD>
		</TR>
		<TR>
			<TD height="49" width="264"><FONT size="4" face="Arial">Zipcode</FONT>
			:</TD>
			<TD height="49" width="323"><INPUT type="text" value="<%=rs1.getString("cust_zip")%>" name="zipcode"
				size="30" onChange="numeric(zipcode)"></TD>
		</TR>
		<TR>
			<TD height="54" width="264"><FONT size="4" face="Arial">Email-id :</FONT></TD>
			<TD height="54" width="323"><INPUT type="text"  value="<%=rs1.getString("cust_email")%>" name="email"
				size="30" onChange="valemail(email)"></TD>
		</TR>
		<TR>
			<TD height="44" width="264"><FONT size="4" face="Arial">Landline :</FONT></TD>
			<TD height="44" width="323"><INPUT type="text" value="<%=rs1.getString("cust_tel_land")%>" name="landline"
				size="30" onChange="numeric(landline)"></TD>
		</TR>
		<TR>
			<TD height="51" width="264"><FONT size="4" face="Arial">Mobile :</FONT></TD>
			<TD height="51" width="323"><INPUT type="text" name="mobile" value="<%=rs1.getString("cust_tel_mobile")%>"
				size="30" onChange="numeric(mobile)"></TD>
		</TR>
		<%
		}
		%>
		<TR>
			<TD height="51" width="264"><INPUT type="submit" name="submit"
				value="SUBMIT" onClick="return checkb();"></TD>
			<TD height="51" width="323"><INPUT type="reset" value="RESET" onClick="return clear();"></TD>
		</TR>
	</TBODY>
</TABLE></form>
</DIV>
<br><br>
<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
			<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    			<td><a href="home_page.jsp" ><font face="Arial" size="2" color="white"><B>HOME</B></font></a></td>

    		</tr>
			</table>

</BODY>
</HTML>
