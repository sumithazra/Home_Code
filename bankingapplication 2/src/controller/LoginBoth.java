/**@author:sumit
 * @date:21-10-2013
 * @implementation_of_changer_equest:CR002
 * @description:It is controller servlet class responsible for view of both admin and customer login.
 *
 * */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginBothBL;

/**
 * Servlet implementation class admin_login_conn
 */
public class LoginBoth extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginBoth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		LoginBothBL obj=new LoginBothBL();
		HttpSession s1=request.getSession(true);
		/**
		 * validate() is defined in LoginBothBL.java for business logic related to Login.
		 * returns Arraylist with values i.e. boolean, user id, role.
		 */
		ArrayList arr=obj.validate(request.getParameter("user_id").toString(),request.getParameter("password").toString());
		 	if((arr.get(0).toString().equals("false")))
		 	{
				//out.println("Invalid Administrator");
				//out.println("Invalid User");
		 		response.sendRedirect("Invalid_username_password.jsp");
			}
		 	if((arr.get(0).toString().equals("true")))
		 	{
				out.println("Valid Administrator");
				out.println("Valid User ...");
				if(arr.get(2).toString().equals("admin"))
				{
				 	s1.setAttribute("user_id",arr.get(1).toString());
					response.sendRedirect("admin_menu.html");
				}
				if(arr.get(2).toString().equals("Customer"))
				{
				 	s1.setAttribute("customer_no",arr.get(1).toString());
					//out.println("<P align=center><FONT size=5 color=blue face=Arial Black><BR> Welcome "+arr.get(1).toString()+ "</FONT></P>");
			  		//out.println("<P align=center><B> <A	href=home_page.jsp><FONT size=5	color=#0000a0 face=Arial>Continue</FONT></A>&gt;&gt;</B><BR><BR></p>");
				 	response.sendRedirect("home_page.jsp");
				}
			}
		}
}
