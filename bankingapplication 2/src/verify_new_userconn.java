import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class verify_new_userconn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public verify_new_userconn() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		out.println("<html>");
		out.println("<BODY background='Image/background.gif'>");
		RequestDispatcher rd = request.getRequestDispatcher("logo_page1.html");
		rd.include(request, response);

		RequestDispatcher rd1 = request.getRequestDispatcher("menu_page.html");
		Connection con=null;

                try
		{
			//String  user_id1=request.getParameter("user_id");
			HttpSession s1=request.getSession(true);
			//String session_account1=(String)s1.getAttribute("user_id");
			//int u_id=Integer.parseInt(session_account);

			Class.forName("oracle.jdbc.OracleDriver");
	        con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sahaana","frozenmind");

	       	PreparedStatement stmt1=con.prepareStatement("select * from temporary_tab");

		    ResultSet rs1=stmt1.executeQuery();


	        //PreparedStatement stmt2=con.prepareStatement("select * from admin_info_tab");
	        //ResultSet rs2=stmt2.executeQuery();
		    out.println("<table><tr><td>");
                   // rd1.include(request, response);
                    out.println("<td>");
		    if(rs1.first()){

				out.println("<form name='admin_view' method='POST' action='verify_new_user.jsp'>");
				out.println("<TABLE border=1>");
				out.println("<TBODY>");
				out.println("<TR bgcolor=#000000>");
				out.println("<TD width=64 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>ACCOUNT NO.</FONT></TD>");
				out.println("<TD width=64 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>ACCOUNT TYPE</FONT></TD>");
				out.println("<TD width=98 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>NAME</FONT></TD>");
				out.println("<TD width=56 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>DATE OF BIRTH</FONT></TD>");
				out.println("<TD width=51 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>SEX</FONT></TD>");
				out.println("<TD width=66 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>MARITAL STATUS</FONT></TD>");
				out.println("<TD width=55 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>OCCUPATION</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>ADDRESS</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>CITY</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>STATE</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>COUNTRY</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>ZIPCODE</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>PHONE</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>MOBILE</FONT></TD>");
				out.println("<TD width=81 align=center height=82><FONT size=4 color=#ff0000 face=Arial Black>EMAIL</FONT></TD>");
				out.println("</TR>");

				do{//displaying values on the screen
	   				out.println("<tr>");
					out.println("<td width=95 height=69>"+rs1.getInt(1)+"</td>");
					out.println("<td width=109 height=69>"+rs1.getString(2)+"</td>");
					out.println("<td width=109 height=69>");
					out.println("<p align=center>");
					String st4=rs1.getString(4);
					if(st4.equals(null))
						out.println(""+rs1.getString(3)+" "+rs1.getString(5));
					else{
						out.println(rs1.getString(3)+" "+rs1.getString(4)+" "+rs1.getString(5));
						out.println("</p></td><td width=73 height=69><p align=center>");
						out.println(rs1.getString(6));
						out.println("</p>");
						out.println("</td> <td width=109 height=69><p align=center>");
						out.println(rs1.getString(7));
						out.println("</p></td><td width=109 height=69<p align=center>");
						out.println(rs1.getString(8));
						out.println("</p></td>	<td width=109 height=69> <p align=center>");
						out.println(rs1.getString(9));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(10));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(11));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(12));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(13));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getInt(14));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(15));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(16));
						out.println("</p></td><td width=109 height=69><p align=center>");
						out.println(rs1.getString(17));
						out.println("</p></td></tr>");
					}
				}while(rs1.next());
		    }else
			{
				 out.println("</table><br>");
				 out.println("<h3 align='center'>No new Registartions found</h3>");
			}
		    }catch(Exception e){
		    	System.out.println(e);
		    }
			finally
		{
			try{
			con.close();
			}catch(SQLException e){}
		}
			out.println("</TBODY></TABLE>");
			//out.println("<br><input type='submit' value='Back'></form></body></html>");
			out.println("<br><br><br><a href='verify_new_user.jsp'>back</a>");

	}
}
