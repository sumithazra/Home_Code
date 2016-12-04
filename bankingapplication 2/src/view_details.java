

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class view_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public view_details() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<TITLE>view customer details</TITLE>");
		out.println("</head>");
		out.println("<BODY background=Image/background.gif>");
		out.println("<TABLE bgcolor='white'><TBODY><TR><TD width='1259' height='73' align='left'>");
		out.println("<img  src='Image/peoples-logo.gif'></TD><td width='437' align='right'><BR></TABLE>");
		//out.println("<tr width='100%'><td><img  src='Image\\lo1.bmp'></table>");
		  Connection con=null;;
		try
			{
			 Class.forName("oracle.jdbc.OracleDriver");
		     con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

		    	HttpSession s=request.getSession(true);
				String session_account=s.getAttribute("customer_no").toString();
				int s_a=Integer.parseInt(session_account);

				out.println("<TABLE><TBODY><TR><TD bgcolor=#000000 valign=top align=center>");
				RequestDispatcher rd=request.getRequestDispatcher("menu_page.html");
				rd.include(request, response);
//				<jsp:include page="menu_page.html" flush="true"/></TD>
				out.println("<TD height=299 align=center width=1106><FONT size=4 color=#0000a0 face=Arial Baltic><B> </B></FONT><FONT size=5 color=#0000a0 face=Arial Black><U><IMG border=0 src='Image/view details.GIF' width=57 height=46>ACCOUNT DETAILS</U></FONT>");
				out.println("<DIV align=right><a href=log_out.jsp><FONT size=3 color=#ff0000 face=Arial> [ Log Out ]</FONT></a></DIV>");
				out.println("<BR><FONT size=4 color=#ff0000 face=Arial Black>Your Account Number is :</FONT><FONT size=4>"+s_a+"</FONT><BR><br>");
				PreparedStatement stmt2=con.prepareStatement("select * from cust_info_tab where cust_acc_no="+s_a);
		     	ResultSet rs1=stmt2.executeQuery();
				rs1.next();

				out.println("<FONT size=4 color=#ff0000 face=Arial Black>Your account type is:</FONT>"+rs1.getString(2));
				out.println("<BR><BR>");
				out.println("<FONT size=4 color=#ff0000 face=Arial Black>Your Balance amount is:</FONT>"+rs1.getDouble(18));
				out.println("<BR>");
				out.println("<FONT color=#ff0000><BR>[ In case of any discrepancies in your details please send an email to pssr_dynamos@gmail.com. ]</FONT><BR><BR>");

				out.println("<table align=center bgColor=#0080c0 border=2 cellPadding=7 cellSpacing=1 align=center><tr onMouseOver=this.bgColor='#336699';onMouseOut=this.bgColor='#0080c0';><td>");
				out.println("<a href=home_page.jsp ><font face=Arial size=2 color=white><B> HOME</B></font></a> </td></tr></table></TBODY></TABLE>");
			}
			catch(Exception e)
			{
			 	System.out.println("error"+e);
			}
			finally
		{
			try{
			con.close();
			}catch(SQLException e){}
		}
			out.println("</body>");
			out.println("</html>");

	}

}
