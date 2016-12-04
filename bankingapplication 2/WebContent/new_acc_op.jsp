<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>New Account</TITLE>
<script language="javascript">

function term()
{
 window.open('T&C.html','','width=600,height=800,scrollbars=yes');
return false;
}

function enablech()
{
if(document.getElementById('check').checked==true)
{
document.getElementById("submit").disabled=false;
}
else
document.getElementById("submit").disabled=true;

}

function checkb()
{
//alert("inside checkb");
	if(document.forms[0].elements[2].value=="")
		{
		alert("Please enter the First Name");
		document.forms[0].elements[2].focus;
		return false;
		}
	if(document.forms[0].elements[3].value=="")
		{
		alert("Please enter the Middle Name");
		document.forms[0].elements[3].focus;
		return false;
		}

	if(document.forms[0].elements[4].value=="")
		{
		alert("Please enter the Last Name");
		document.forms[0].elements[4].focus;
		//alert("inside checkb 4th");
		return false;
		}
	if(document.forms[0].elements[5].value=="")
		{
		alert("Please enter the Date of Birth");
		document.forms[0].elements[5].focus;
		//alert("inside checkb 5th");
		return false;
		}
	if(document.forms[0].elements[10].value=="")
		{
		alert("Please enter the Occupation");
		document.forms[0].elements[10].focus;
		//alert("inside checkb 8th");
		return false;
		}
	if(document.forms[0].elements[11].value=="")
		{
		alert("Please enter the Address");
		document.forms[0].elements[11].focus;
		//alert("inside checkb 9th");
		return false;
		}
	if(document.forms[0].elements[12].value=="")
		{
		alert("Please enter the City");
		document.forms[0].elements[12].focus;
		//alert("inside checkb 10th");
		return false;
		}
	if(document.forms[0].elements[13].value=="")
		{
		alert("Please enter the State");
		document.forms[0].elements[13].focus;
		//alert("inside checkb 11th");
		return false;
		}
		if(document.forms[0].elements[14].value=="")
		{
		alert("Please enter the Country");
		document.forms[0].elements[14].focus;
		//alert("inside checkb 11th");
		return false;
		}
		if(document.forms[0].elements[15].value=="")
		{
		alert("Please enter the Zip Code");
		document.forms[0].elements[15].focus;
		//alert("inside checkb 11th");
		return false;
		}
		if(document.forms[0].elements[16].value=="")
		{
		alert("Please enter the Email");
		document.forms[0].elements[16].focus;
		//alert("inside checkb 11th");
		return false;
		}
		if(document.forms[0].elements[17].value=="")
		{
		alert("Please enter the Landline telephone number");
		document.forms[0].elements[17].focus;
		//alert("inside checkb 11th");
		return false;
		}
		if(document.forms[0].elements[18].value=="")
		{
		alert("Please enter the Mobile number");
		document.forms[0].elements[18].focus;
		//alert("inside checkb 11th");
		return false;
		}
}


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
    if(len==0 )
    {
    alert("Field cannot be empty");
    }
    else if(len>0)
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

var dtCh= "-";
var minYear=1900;
var maxYear=2100;

function isInteger(s)
{
	var i;
    	for (i = 0; i < s.length; i++)
	{
        	// Check that current character is number.
        	var c = s.charAt(i);
        	if (((c < "0") || (c > "9")))
			return false;
    	}
    	// All characters are numbers.
    	return true;
}

function stripCharsInBag(s, bag)
{
	var i;
	var returnString = "";
    	// Search through string's characters one by one.
    	// If character is not in bag, append to returnString.
    	for (i = 0; i < s.length; i++)
	{
        	var c = s.charAt(i);
        	if (bag.indexOf(c) == -1)
			returnString += c;
    	}
    	return returnString;
}

function daysInFebruary (year)
{
	// February has 29 days in any year evenly divisible by four,
	// EXCEPT for centurial years which are not also divisible by 400.
    	return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}

function DaysArray(n)
{
	for (var i = 1; i <= n; i++)
	{
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11)
		{
			this[i] = 30
		}
		if (i==2)
		{
			this[i] = 29
		}
	}
   	return this
}

function isDate(dtStr)
{
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(pos1+1,pos2)
	var strDay=dtStr.substring(0,pos1)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++)
	{
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1)
	{
		alert("The date format should be : dd-mm-yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12)
	{
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month])
	{
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear)
	{
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false)
	{
		alert("Please enter a valid date")
		return false
	}
	return true
}

function ValidateDate()
{
	var dt=document.new_acc_op.dob
	if (isDate(dt.value)==false)
	{
		dt.focus()
		return false
	}
    	return true
}


</script>

</HEAD>
<BODY background="Image/background.gif">s
<div align="center">
<jsp:include page="logo_page1.html" flush="true" />
</div>
<TABLE>
    <TBODY>
        <TR>
            <TD height="817" width="1222">
            <form name="new_acc_op" method="POST" action="Customer"><center><h1><FONT
				size="3" face="Arial"><U><FONT color="#000080" size="5" face="Arial Black"><IMG
				border="0" src="Image/register2.jpg" width="135" height="94">NEW ACCOUNT OPENING</FONT></U></FONT><FONT
				size="3" color="#000000" face="Arial Baltic"><BR></FONT><FONT
				size="3" color="#ff0000" face="Arial Baltic"> <BR>
			( Please fill the details carefully )</FONT><FONT size="3"
				color="#000000" face="Arial Baltic"><BR>
			<BR>
			( </FONT><FONT size="3" color="#ff0000" face="Arial Baltic">*</FONT><FONT
				size="3" color="#000000" face="Arial Baltic"> Compulsory Fields ) <BR>
			</FONT></h1></center>
			<TABLE width="778" height="572" align="center" border="1">
				<TBODY>
					<TR>
						<TD height="31" width="377"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Account Type :</FONT></B></FONT></TD>
						<TD height="31" width="395"><FONT size="3" face="Arial"><B><INPUT
							type="radio" name="r1" value="current" checked>Current Account<INPUT
							type="radio" name="r1" value="saving">Savings Account</B></FONT></TD>
					</TR>
					<TR>
						<TD height="33" width="377"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> First Name :</FONT></B></FONT></TD>
						<TD height="33" width="395"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="fname" size="20" value=""
							onChange="checkalpha(fname)"></B></FONT></TD>
					</TR>
					<TR>
						<TD height="34" width="377"><FONT size="3" face="Arial"><B><FONT>
						</FONT><FONT color="#ff0000">*</FONT><FONT> Middle Name :</FONT></B></FONT></TD>
						<TD height="34" width="395"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="mname" size="20" value=""
							onChange="checkalpha(mname)"></B></FONT></TD>
					</TR>
					<TR>
						<TD height="35" width="377"><FONT size="3" face="Arial"><B><FONT>
						</FONT><FONT color="#ff0000">*</FONT><FONT> Last Name :</FONT></B></FONT></TD>
						<TD height="35" width="395"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="lname" size="20" value=""
							onChange="checkalpha(lname)"></B></FONT></TD>
					</TR>
					<TR>
						<TD height="35" width="377"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Date of Birth ( dd-mm-yyyy ):</FONT></B></FONT></TD>
						<TD height="35" width="395"><FONT size="3" face="Arial"><INPUT
							type="text" name="dob" size="20" maxlength="10"
							onChange="return ValidateDate()"></FONT></TD>
					</TR>
					<TR>
						<TD height="34" width="377"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Sex :</FONT></B></FONT></TD>
						<TD height="34" width="395"><FONT size="3" face="Arial"><B><INPUT
							type="radio" name="r2" value="male" checked>Male<INPUT
							type="radio" name="r2" value="female">Female</B></FONT></TD>
					</TR>
					<TR>
						<TD height="38" width="377"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Marital Status :</FONT></B></FONT></TD>
						<TD height="38" width="395"><FONT size="3" face="Arial"><B><INPUT
							type="radio" name="r3" value="single" checked>Single<INPUT
							type="radio" name="r3" value="married">Married</B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="36"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Occupation :</FONT></B></FONT></TD>
						<TD width="395" height="36"><FONT size="3" face="Arial"><INPUT
							type="text" name="occupation" size="20" maxlength="20"
							onChange="checkalpha(occupation)"></FONT></TD>
					</TR>

					<TR>
						<TD width="377" height="37"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Address ( for corrospondance ) :</FONT></B></FONT></TD>
						<TD width="395" height="37"><FONT sizedsf="3" face="Arial"><B> <TEXTAREA
							rows="4" cols="20" name="add1" onChange="alphanumeric(add1);"></TEXTAREA></B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="36"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> City :</FONT></B></FONT></TD>
						<TD width="395" height="36"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="city1" size="20" value=""
							onChange="checkalpha(city1)"></B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="39"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> State :</FONT></B></FONT></TD>
						<TD width="395" height="39"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="state1" size="20" value=""
							onChange="checkalpha(state1)"></B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="42"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Country :</FONT></B></FONT></TD>
						<TD width="395" height="42"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="country1" size="20" value=""
							onChange="checkalpha(country1)"></B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="47"><FONT size="3" face="Arial"><B><FONT>
						</FONT><FONT color="#ff0000">*</FONT><FONT> Zipcode :</FONT></B></FONT></TD>
						<TD width="395" height="47"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="zip1" size="20" value="" maxlength="10"
							onChange="numeric(zip1)"></B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="44"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Email :</FONT></B></FONT></TD>
						<TD width="395" height="44"><FONT size="3" face="Arial"><B><INPUT
							type="text" name="email" size="20" value=""
							onChange="valemail(email)"></B></FONT></TD>
					</TR>
					<TR>
						<TD width="377" height="37"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Telephone No. :</FONT></B></FONT></TD>
						<TD width="395" height="37"><FONT size="3" face="Arial"><B>Landline
						: <INPUT type="text" name="landline" size="10" value="" maxlength="10"
							onChange="numeric(landline)"> Mobile : <INPUT type="text"
							name="mobile" size="10" maxlength="10" value="" onChange="numeric(mobile)"></B></FONT></TD>
					</TR>

					<TR>
						<TD width="377" height="37"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Security Question :</FONT></B></FONT></TD>
						<TD width="395" height="37"><FONT size="3" face="Arial"><B>
						 <select>
  <option value="pet name">What's your pet name?</option>
  <option value="nick name">What's your nick Name?</option>
  <option value="favourite Actor">Who is your favourite Actor?</option>

</select> </B></FONT></TD>
					</TR>

					<TR>
						<TD width="377" height="37"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Security Answer :</FONT></B></FONT></TD>
						<TD width="395" height="37"><FONT size="3" face="Arial"><B>
						<INPUT type="text" name="answer" size="10" value="" maxlength="10"></B></FONT></TD>
					</TR>


					<TR>
						<TD width="377" height="37"><FONT size="3" face="Arial"><B><FONT
							color="#ff0000">*</FONT><FONT> Terms & Condition :</FONT></B></FONT></TD>
						<TD width="395" height="37"><FONT size="3" face="Arial"><B>
						<input type="checkbox" id="check" onclick="enablech()"></INPUT><a href="" onclick="term()">Terms & Condition</a> </B></FONT></TD>
					</TR>


					<TR>
						<TD valign="middle" align="center" width="377" height="28"><FONT
							size="3" face="Arial"><INPUT type="Submit" id="submit"
							size="20" value="SUBMIT" onClick="return checkb()" disabled="disabled"></FONT></TD>
						<TD valign="middle" align="center" width="395" height="28"><FONT
							size="3" face="Arial"><INPUT type="Reset" name="reset" size="20"
							value="RESET" onClick="clear()"></FONT></TD>
					</TR>

				</TBODY>
			</TABLE>
			</form>
<table align="center" bgColor="#0080c0" border="2" cellPadding="7" cellSpacing="1" align="center">
			<tr onMouseOver="this.bgColor='#336699';"onMouseOut="this.bgColor='#0080c0';">
    			<td><a href="login.jsp" ><font face="Arial" size="2" color="white"><B>HOME</B></font></a></td>

    		</tr>
			</table>
			</table>

</BODY>
</HTML>